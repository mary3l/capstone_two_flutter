import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tflite_audio/tflite_audio.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
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

  Future<void> loadModels() async {
    speechInterpreter = await Interpreter.fromAsset(intendedSpeechPath);
    noiseInterpreter = await Interpreter.fromAsset(intendedNoisePath);
  }

  classifyAudio(List<List<double>> audioInput) {
    // Output arrays for both models
    var speechOutput = List<double>.filled(20, 0.0).reshape([1, 20]);
    var noiseOutput = List<double>.filled(3, 0.0).reshape([1, 3]);

    // Run the model inference
    speechInterpreter.run(audioInput, speechOutput);
    noiseInterpreter.run(audioInput, noiseOutput);

    print(speechOutput);
    print(noiseOutput);
  }

  Future<List<List<double>>> getAudioInput() async {
    // Stream audio input from the microphone
    Stream<List<int>> stream = await MicStream.microphone(sampleRate: 44100);
    List<int> audioSamples = [];

    // Collect audio samples from the stream
    await for (final sample in stream) {
      audioSamples.addAll(sample);
      if (audioSamples.length >= 44032) {
        // Collect 44032 samples
        break;
      }
    }

    if (audioSamples.isEmpty) {
      print('No audio samples captured.');
      return [
        [0.0]
      ]; // Return a silent input if no samples were captured
    }

    // Convert raw audio data to List<float32>
    List<double> audioInput = audioSamples
        .map((sample) => sample.toDouble() / 32768.0)
        .toList(); // Normalize

    // Ensure the input shape is [1, 44032]
    return [audioInput]; // Wrap in another list for model input
  }

  Future<void> getResult() async {
    isRecording.value = true;

    List<List<double>> audioInput = await getAudioInput();
    print('Audio Input: $audioInput');

    Duration recordingDuration = Duration(seconds: 5);

    // Use a Timer to stop recording after the duration
    Timer(recordingDuration, () {
      isRecording.value = false;
      print(
          'Audio recognition stopped after ${recordingDuration.inSeconds} seconds');
      // Add logic to stop recording if necessary (if needed, e.g., clearing streams)
    });
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
            if (!value) {
              return FloatingActionButton(
                onPressed: () {
                  getResult();
                },
                backgroundColor: Colors.blue,
                child: const Icon(Icons.mic),
              );
            } else {
              return FloatingActionButton(
                onPressed: () {
                  // Optionally, add logic to stop recording if necessary
                  print('Audio Recognition Stopped');
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
