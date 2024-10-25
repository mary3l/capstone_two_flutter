import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:mic_stream/mic_stream.dart';

void main() => runApp(const AudioClassification());

class AudioClassification extends StatefulWidget {
  const AudioClassification({Key? key}) : super(key: key);

  @override
  _AudioClassificationState createState() => _AudioClassificationState();
}

class _AudioClassificationState extends State<AudioClassification> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final isRecording = ValueNotifier<bool>(false);
  dynamic speechInterpreter;
  dynamic noiseInterpreter;

  final String intendedSpeechPath =
      'assets/model/intended-speech/soundclassifier_with_metadata.tflite';
  final String intendedSpeechLabelPath =
      'assets/model/intended-speech/labels.txt';
  Future<List<String>>? intendedSpeechLabelList;
  final String intendedNoisePath =
      'assets/model/intended-noise/soundclassifier_with_metadata.tflite';

  String model1Result = 'Loading Speech Model...';
  String model2Result = 'Loading Noise Model...';

  late Stream<List<int>> audioStream;
  late StreamSubscription<List<int>> audioStreamSubscription;

  Future<void> loadModels() async {
    speechInterpreter = await Interpreter.fromAsset(intendedSpeechPath);
    noiseInterpreter = await Interpreter.fromAsset(intendedNoisePath);
    intendedSpeechLabelList = fetchLabelList();
    audioStream = MicStream.microphone(sampleRate: 44100).asBroadcastStream();
  }

  ///fetches the labels from the text file in assets
  Future<List<String>> fetchLabelList() async {
    List<String> _labelList = [];
    await rootBundle.loadString(this.intendedSpeechLabelPath).then((q) {
      for (String i in const LineSplitter().convert(q)) {
        _labelList.add(i);
      }
    });
    return _labelList;
  }

  Future<String> classifiedInput(
      List<double> speechOutput, List<double> noiseOutput) async {
    // Find the predicted class for speech
    double speechPredictedClass = speechOutput.reduce((a, b) => a > b ? a : b);
    double noisePredictedClass = noiseOutput.reduce((a, b) => a > b ? a : b);

    print('SpeechOutput $speechOutput');
    print('NoiseOutput $noiseOutput');
    print('Predicted Speech Class: $speechPredictedClass');
    print('Predicted Noise Class: $noisePredictedClass');

    return "";
  }

  Future<void> classifyAudio(List<double> audioInput) async {
    const int expectedLength = 44032; // Expected input length
    const int speechOutputSize = 20; // Adjust output shape if needed
    const int noiseOutputSize = 3; // Adjust output shape if needed

    // Prepare output buffers
    var speechOutput = List<double>.filled(speechOutputSize, 0.0)
        .reshape([1, speechOutputSize]);
    var noiseOutput =
        List<double>.filled(noiseOutputSize, 0.0).reshape([1, noiseOutputSize]);

    try {
      // Run the model inference
      speechInterpreter.run(
          audioInput.reshape([1, expectedLength]), speechOutput);
      noiseInterpreter.run(
          audioInput.reshape([1, expectedLength]), noiseOutput);
    } catch (e) {
      print('Inference error: $e');
      return; // Exit if there was an inference error
    }
    classifiedInput(speechOutput[0], noiseOutput[0]);
  }

  Future<void> startListening() async {
    isRecording.value = true;
    List<double> audioInputBuffer = [];

    // Start listening to the microphone stream
    audioStreamSubscription = audioStream.listen((List<int> samples) async {
      List<double> audioInput =
          samples.map((sample) => sample.toDouble() / 32768.0).toList();
      audioInputBuffer.addAll(audioInput);

      // Process the audio input once we have enough data
      while (audioInputBuffer.length >= 44032) {
        List<double> currentInput = audioInputBuffer.sublist(0, 44032);
        audioInputBuffer.removeRange(0, 44032);

        await classifyAudio(currentInput);
      }
    });
  }

  Future<void> stopListening() async {
    isRecording.value = false;
    await audioStreamSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('TFLite Audio Classification'),
        ),
        body: FutureBuilder<void>(
          future: loadModels(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                  child: Text('Error loading models: ${snapshot.error}'));
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Speech Model Result: $model1Result'),
                    Text('Noise Model Result: $model2Result'),
                  ],
                ),
              );
            }
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ValueListenableBuilder(
          valueListenable: isRecording,
          builder: (context, value, widget) {
            if (value == false) {
              return FloatingActionButton(
                onPressed: () {
                  startListening();
                },
                backgroundColor: Colors.blue,
                child: const Icon(Icons.mic),
              );
            } else {
              return FloatingActionButton(
                onPressed: () {
                  stopListening();
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

  @override
  void dispose() {
    speechInterpreter.close();
    noiseInterpreter.close();
    super.dispose();
  }
}
