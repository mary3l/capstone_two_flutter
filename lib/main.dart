import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

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

  List<MapEntry<String, double>> biggestValue = List.empty();
  var _showError = false;

  void _startRecorder() {
    try {
      platform.invokeMethod('startRecord');
    } on PlatformException catch (e) {
      log("Failed to start record: '${e.message}'");
    }
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
    bool success = await _requestPermission();
    if (success) {
      _startRecorder();

      Timer.periodic(Duration(milliseconds: _expectAudioLength), (timer) {
        // classify here
        _runInference();
      });
    } else {
      // show error here
      setState(() {
        _showError = true;
      });
    }
  }

  Future<void> _runInference() async {
    Float32List inputArray = await _getAudioFloatArray();

    // Adjust the input array to match your model's input tensor
    final resultSpeech = await _helperSpeech
        .inference(inputArray.sublist(0, _requiredInputBuffer));
    final resultNoise = await _helperNoise
        .inference(inputArray.sublist(0, _requiredInputBuffer));
    _VoteBetweenModels(resultSpeech, resultNoise);
    // Since your model outputs two classes, we can simply get the output directly
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

    setState(() {
      print(biggestValue);
      biggestValue = biggestValue;
    });
  }

  @override
  void dispose() {
    _closeRecorder();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.5),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_showError) {
      return const Center(
        child: Text(
          "Audio recording permission required for audio classification",
          textAlign: TextAlign.center,
        ),
      );
    } else {
      return (Column(
        children: [Text(biggestValue[0].key.toString())],
      )); /* ListView.separated(
        padding: const EdgeInsets.all(10),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: _classification.length,
        itemBuilder: (context, index) {
          final item = _classification[index];
          return Row(
            children: [
              SizedBox(
                width: 200,
                child: Text(item.key),
              ),
              Flexible(
                child: LinearProgressIndicator(
                  value: item.value,
                  minHeight: 20,
                ),
              )
            ],
          );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
          height: 10,
        ),
      ); */
    }
  }
}
