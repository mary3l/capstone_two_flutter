import 'package:flutter/material.dart';
import 'package:tflite_audio/tflite_audio.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:async';

void main() => runApp(const AudioClassification());

class AudioClassification extends StatefulWidget {
  const AudioClassification({Key? key}) : super(key: key);

  @override
  _AudioClassificationState createState() => _AudioClassificationState();
}

class _AudioClassificationState extends State<AudioClassification> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final isRecording = ValueNotifier<bool>(false);
  Stream<Map<dynamic, dynamic>>? result;
  String currentModel = 'speech'; // Track the current model

  /// Paths for both models and labels
  final String intendedSpeechPath =
      'assets/model/intended-speech/soundclassifier_with_metadata.tflite';
  final String intendedSpeechLabel = 'assets/model/intended-speech/labels.txt';
  final String intendedNoisePath =
      'assets/model/intended-noise/soundclassifier_with_metadata.tflite';
  final String intendedNoiseLabel = 'assets/model/intended-noise/labels.txt';

  final String inputType = 'rawAudio';
  final int sampleRate = 44100;
  final int bufferSize = 11016;
  final bool outputRawScores = false;
  final int numOfInferences = 5;
  final int numThreads = 1;
  final bool isAsset = true;

  /// Tuning parameters
  final double detectionThreshold = 0.7;
  final int averageWindowDuration = 1000;
  final int minimumTimeBetweenSamples = 30;
  final int suppressionTime = 1500;

  @override
  void initState() {
    super.initState();
    loadModel(currentModel); // Load the initial model
  }

  /// Load the respective model based on the current mode (speech/noise)
  Future<void> loadModel(String modelType) async {
    if (modelType == 'speech') {
      await TfliteAudio.loadModel(
        inputType: inputType,
        model: intendedSpeechPath,
        label: intendedSpeechLabel,
      );
    } else {
      await TfliteAudio.loadModel(
        inputType: inputType,
        model: intendedNoisePath,
        label: intendedNoiseLabel,
      );
    }
    startRecognition();
  }

  /// Start audio recognition
  void startRecognition() {
    result = TfliteAudio.startAudioRecognition(
      sampleRate: sampleRate,
      bufferSize: bufferSize,
      numOfInferences: numOfInferences,
    );

    result?.listen((event) {
      print("Recognition Result: " + event["recognitionResult"].toString());
    }).onDone(() {
      isRecording.value = false;
      switchModel(); // Switch models when done
    });
  }

  /// Switch between speech and noise models
  void switchModel() {
    setState(() {
      if (currentModel == 'speech') {
        currentModel = 'noise';
      } else {
        currentModel = 'speech';
      }
      loadModel(currentModel); // Load the new model
    });
  }

  /// Stop audio recognition
  void stopRecognition() {
    TfliteAudio.stopAudioRecognition();
    isRecording.value = false;
  }

  Future<List<String>> fetchLabelList(String modelType) async {
    String labelFile =
        modelType == 'speech' ? intendedSpeechLabel : intendedNoiseLabel;

    List<String> _labelList = [];
    await rootBundle.loadString(labelFile).then((q) {
      for (String i in const LineSplitter().convert(q)) {
        _labelList.add(i);
      }
    });
    return _labelList;
  }

  String showResult(AsyncSnapshot snapshot, String key) =>
      snapshot.hasData ? snapshot.data[key].toString() : '0 ';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: const Text('Tflite-audio/speech'),
        ),
        body: Column(
          children: [
            StreamBuilder<Map<dynamic, dynamic>>(
              stream: result,
              builder: (BuildContext context,
                  AsyncSnapshot<Map<dynamic, dynamic>> inferenceSnapshot) {
                return FutureBuilder<List<String>>(
                  future: fetchLabelList(intendedSpeechLabel),
                  builder: (BuildContext context,
                      AsyncSnapshot<List<String>> labelSnapshot) {
                    switch (inferenceSnapshot.connectionState) {
                      case ConnectionState.none:
                        return labelListWidget(labelSnapshot.data);
                      case ConnectionState.waiting:
                        return const CircularProgressIndicator();
                      default:
                        return labelListWidget(
                          labelSnapshot.data,
                          inferenceSnapshot.data?["recognitionResult"] ?? "0",
                        );
                    }
                  },
                );
              },
            ),
            // Switch between speech and noise models
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => switchModel(),
                  child: const Text("Use Speech Model"),
                ),
                ElevatedButton(
                  onPressed: () => switchModel(),
                  child: const Text("Use Noise Model"),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: ValueListenableBuilder(
          valueListenable: isRecording,
          builder: (context, value, widget) {
            if (value == false) {
              return FloatingActionButton(
                onPressed: () {
                  startRecognition();
                },
                backgroundColor: Colors.blue,
                child: const Icon(Icons.mic),
              );
            } else {
              return FloatingActionButton(
                onPressed: () {
                  print('Audio Recognition Stopped');
                  TfliteAudio.stopAudioRecognition();
                  isRecording.value = false;
                },
                backgroundColor: Colors.red,
                child: const Icon(Icons.adjust),
              );
            }
          },
        ),
      ),
    );
  }

  Widget labelListWidget(List<String>? labelList, [String? result]) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: labelList?.map((labels) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  labels,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: labels == result ? Colors.green : Colors.black,
                  ),
                ),
              );
            }).toList() ??
            [],
      ),
    );
  }
}
