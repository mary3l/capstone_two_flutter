import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:audio_classification/helper/classification_list_helper.dart';

import 'helper/audio_classification_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const AudioClassificationApp());
}

class AudioClassificationApp extends StatelessWidget {
  const AudioClassificationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Classification',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Audio classification home page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platform =
      MethodChannel('org.tensorflow.audio_classification/audio_record');

  // Update to match your model's specifications
  static const _sampleRate = 44100; // 44.1 kHz
  static const _expectAudioLength =
      1000; // milliseconds (you can adjust this as needed)
  final int _requiredInputBuffer =
      (_sampleRate * (_expectAudioLength / 1000)).toInt(); // Adjust as needed
  late AudioClassificationHelper _helperSpeech;
  late AudioClassificationHelper _helperNoise;
  List<MapEntry<String, double>> _classificationSpeech = List.empty();
  List<MapEntry<String, double>> _classificationNoise = List.empty();

  late KeywordList keywordList;
  List<MapEntry<String, double>> biggestValue = List.empty();
  ValueNotifier<bool> _isRecording = ValueNotifier(false);
  bool _hasPermission = false;

  List<String> _keywordCombinations = List.empty(growable: true);

  Future<void> _startRecorder() async {
    print('Starting recording');
    try {
      platform.invokeMethod('startRecord');
      if (_hasPermission) {
        _isRecording.value = true;
        Timer.periodic(
          Duration(milliseconds: _expectAudioLength),
          (timer) {
            if (!_isRecording.value) {
              timer.cancel(); // Stop the timer when recording ends
            } else {
              _runInference();
            }
          },
        );
      }
    } on PlatformException catch (e) {
      log("Failed to start record: '${e.message}'");
    }
  }

  void _stopRecorder() {
    log('Stopping recording');
    try {
      platform.invokeMethod('stopRecord');
    } on PlatformException catch (e) {
      log("Failed to stop record: ${e.message}");
    }
    _isRecording.value = false;
    keywordList = KeywordList();
    print('keywords ${_keywordCombinations.toString()}');
    _keywordCombinations.clear();

    /* final List<String> _keywordCombinations = [
      "Player Fifty",
      "Made",
      "3",
    ]; */
    /* print('matches?${keywordList.matches(_keywordCombinations)}');
    print('keyword combinations${_keywordCombinations}'); */
  }

  Future<bool> _requestPermission() async {
    try {
      return await platform.invokeMethod('requestPermissionAndCreateRecorder', {
        "sampleRate": _sampleRate,
        "requiredInputBuffer": _requiredInputBuffer
      });
    } on Exception catch (e) {
      log("Failed to create recorder: '${e.toString()}'");
      return false;
    }
  }

  Future<Float32List> _getAudioFloatArray() async {
    var audioFloatArray = Float32List(0);
    try {
      final Float32List result =
          await platform.invokeMethod('getAudioFloatArray');
      audioFloatArray = result;
    } on PlatformException catch (e) {
      log("Failed to get audio array: '${e.message}'");
    }
    return audioFloatArray;
  }

  Future<void> _closeRecorder() async {
    try {
      await platform.invokeMethod('closeRecorder');
      _helperSpeech.closeInterpreter();
      _helperNoise.closeInterpreter();
    } on PlatformException {
      log("Failed to close recorder.");
    }
  }

  @override
  void initState() {
    _initRecorder();
    super.initState();
  }

  Future<void> _initRecorder() async {
    const _modelSpeechPath =
        'assets/models/intended-speech/soundclassifier_with_metadata.tflite';
    const _modelSpeechlabelsPath = 'assets/models/intended-speech/labels.txt';
    const _modelSpeechSize = 20;
    const _modelNoisePath =
        'assets/models/intended-noise/soundclassifier_with_metadata.tflite';
    const _modelNoiselabelsPath = 'assets/models/intended-noise/labels.txt';
    const _modelNoiseSize = 7;
    _helperSpeech = AudioClassificationHelper(
      _modelSpeechPath,
      _modelSpeechlabelsPath,
      _modelSpeechSize,
    );
    _helperNoise = AudioClassificationHelper(
        _modelNoisePath, _modelNoiselabelsPath, _modelNoiseSize);
    await _helperSpeech.initHelper();
    await _helperNoise.initHelper();
    _hasPermission = await _requestPermission();
  }

  Future<void> _runInference() async {
    Float32List inputArray = await _getAudioFloatArray();

    // Adjust the input array to match your model's input tensor
    final resultSpeech = await _helperSpeech
        .inference(inputArray.sublist(0, _requiredInputBuffer));
    final resultNoise = await _helperNoise
        .inference(inputArray.sublist(0, _requiredInputBuffer));
    _VoteBetweenModels(resultSpeech, resultNoise);
  }

  void _VoteBetweenModels(resultSpeech, resultNoise) {
    _classificationSpeech = [
      (resultSpeech.entries as Iterable<MapEntry<String, double>>)
          .reduce((a, b) => a.value > b.value ? a : b)
    ];

    _classificationNoise = [
      (resultNoise.entries as Iterable<MapEntry<String, double>>)
          .reduce((a, b) => a.value > b.value ? a : b)
    ];

    if (_classificationSpeech[0].value > _classificationNoise[0].value) {
      biggestValue = _classificationSpeech; // Speech classification wins
    } else {
      biggestValue = _classificationNoise; // Noise classification wins
    }

    if (_keywordCombinations.length < 3) {
      _keywordCombinations.add(biggestValue[0].key);
    } else {
      _stopRecorder();
    }

    setState(() {
      biggestValue = biggestValue;
      print(biggestValue[0].key);
    });
  }

  @override
  void dispose() {
    _closeRecorder();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TFLite Audio Classification'),
        ),
        body: Container(
          child: Column(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(''),
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ValueListenableBuilder(
          valueListenable: _isRecording,
          builder: (context, value, widget) {
            if (value == false) {
              return FloatingActionButton(
                onPressed: () {
                  _startRecorder();
                },
                backgroundColor: Colors.blue,
                child: const Icon(Icons.mic),
              );
            } else {
              return FloatingActionButton(
                onPressed: () {
                  _stopRecorder();
                },
                backgroundColor: Colors.red,
                child: const Icon(Icons.stop),
              );
            }
          },
        ),
      ),
    );
  }
}
