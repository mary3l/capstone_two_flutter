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

  Future<String> classifiedInput(List<double> speechOutput) async {
    // Find the predicted class for speech
    List<String> intendedSpeechLabels = await fetchLabelList();
    double speechPredictedClass = speechOutput.reduce((a, b) => a > b ? a : b);
    //double noisePredictedClass = noiseOutput.reduce((a, b) => a > b ? a : b);
    int predictedIndex = await speechOutput.indexWhere(
        (value) => value == speechOutput.reduce((a, b) => a > b ? a : b));

    print('SpeechOutput $speechOutput');
    //print('NoiseOutput $noiseOutput');
    print('$predictedIndex');
    //print('Predicted Noise Class: $noisePredictedClass');
    setState(() {
      model1Result = intendedSpeechLabels[predictedIndex];
    });
    return "";
  }

  double probabilityThreshold = 0.7;
  Future<void> classifyAudio(List<double> audioInput) async {
    const int expectedLength = 44032; // Expected input length
    const int speechOutputSize = 20; // Adjust output shape if needed
    const int noiseOutputSize = 3; // Adjust output shape if needed

    // Prepare output buffers
    var speechOutput = List<double>.filled(speechOutputSize, 0.0)
        .reshape([1, speechOutputSize]);
    var noiseOutput =
        List<double>.filled(noiseOutputSize, 0.0).reshape([1, noiseOutputSize]);

    int predictionTimeStart = DateTime.now().millisecondsSinceEpoch;
    speechInterpreter?.run(
        audioInput.reshape([1, expectedLength]), speechOutput);
    int predictionTime =
        DateTime.now().millisecondsSinceEpoch - predictionTimeStart;
    print('Prediction time: $predictionTime ms');
    classifiedInput(speechOutput[0]);
  }

  double overlapFactor = 0.75; // Set overlap factor, e.g., 0.5 for 50%
  final int expectedLength = 44032; // Length in samples
  Future<void> startListening() async {
    final int predictionInterval =
        (expectedLength * (1 - overlapFactor)).toInt();
    isRecording.value = true;
    List<double> audioInputBuffer = [];

    audioStreamSubscription = audioStream.listen((List<int> samples) async {
      // Normalize the samples to the range [-1, 1] and add to the buffer
      List<double> audioInput =
          samples.map((s) => s.toDouble() / 32768.0).toList();
      audioInputBuffer.addAll(audioInput);

      // Check if we have enough data for classification
      while (audioInputBuffer.length >= expectedLength) {
        // Take the first expectedLength samples for classification
        List<double> currentInput = audioInputBuffer.sublist(0, expectedLength);
        await classifyAudio(currentInput);

        // Remove the processed samples based on predictionInterval for overlap
        int removeUntilIndex = predictionInterval < audioInputBuffer.length
            ? predictionInterval
            : audioInputBuffer.length;
        audioInputBuffer.removeRange(0, removeUntilIndex);
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
