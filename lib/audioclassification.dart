import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tflite_audio/tflite_audio.dart';
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
  final String intendedNoisePath =
      'assets/model/intended-noise/soundclassifier_with_metadata.tflite';

  String model1Result = 'Loading Speech Model...';
  String model2Result = 'Loading Noise Model...';

  late Stream<List<int>> audioStream;

  Future<void> loadModels() async {
    speechInterpreter = await Interpreter.fromAsset(intendedSpeechPath);
    noiseInterpreter = await Interpreter.fromAsset(intendedNoisePath);
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

    print(speechOutput);
    print(noiseOutput);
  }

  Future<void> startListening() async {
    isRecording.value = true;

    // Start the microphone stream
    audioStream = await MicStream.microphone(sampleRate: 44100);

    // Buffer to collect audio data
    List<double> audioInputBuffer = [];

    // Listen to the microphone stream continuously
    audioStream.listen((List<int> samples) async {
      // Convert raw audio data to List<double>
      List<double> audioInput =
          samples.map((sample) => sample.toDouble() / 32768.0).toList();
      audioInputBuffer.addAll(audioInput);

      // Process the audio input once we have enough data
      while (audioInputBuffer.length >= 44032) {
        // Extract the first 44032 samples and remove them from the buffer
        List<double> currentInput = audioInputBuffer.sublist(0, 44032);
        audioInputBuffer.removeRange(0, 44032); // Remove processed samples

        await classifyAudio(
            currentInput); // Call classifyAudio with the current input
      }
    });
  }

  Future<void> stopListening() async {
    isRecording.value = false;
    //await MicStream.stop(); // Stop the microphone stream
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
