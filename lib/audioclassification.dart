import 'package:flutter/material.dart';
import 'package:tflite_audio/tflite_audio.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

void main() => runApp(const AudioClassification());

class AudioClassification extends StatefulWidget {
  const AudioClassification({Key? key}) : super(key: key);

  @override
  _AudioClassificationState createState() => _AudioClassificationState();
}

class _AudioClassificationState extends State<AudioClassification> {
  var model1 = Future<dynamic>;
  var model2 = Future<dynamic>;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final isRecording = ValueNotifier<bool>(false);
  Stream<Map<dynamic, dynamic>>? result;

  final String intendedSpeechPath =
      'assets/model/intended-speech/soundclassifier_with_metadata.tflite';
  final String intendedSpeechLabel = 'assets/model/intended-speech/labels.txt';

  final String intendedNoisePath =
      'assets/model/intended-noise/soundclassifier_with_metadata.tflite';
  final String intendedNoiseLabel = 'assets/model/intended-noise/labels.txt';
  final String inputType = 'rawAudio';
  final String audioDirectory = 'assets/model/sample_audio_44k_mono.wav';
  final int sampleRate = 44100;
  final int bufferSize = 11016;

  final bool outputRawScores = false;
  final int numOfInferences = 5;
  final int numThreads = 1;
  final bool isAsset = true;

  final double detectionThreshold = 0.3;
  final int averageWindowDuration = 1000;
  final int minimumTimeBetweenSamples = 30;
  final int suppressionTime = 1500;

  @override
  void initState() {
    super.initState();
    TfliteAudio.setSpectrogramParameters(nMFCC: 40, hopLength: 16384);
  }

  Future<dynamic> startRecognitionWithModel({
    required String modelPath,
    required String labelPath,
    required int sampleRate,
    required int bufferSize,
    required int numOfInferences,
  }) async {
    await TfliteAudio.loadModel(
      model: modelPath,
      label: labelPath,
      inputType: 'raw',
      outputRawScores: false,
      numThreads: 1,
      isAsset: true,
    );

    return TfliteAudio.startAudioRecognition(
      sampleRate: sampleRate,
      bufferSize: bufferSize,
      numOfInferences: numOfInferences,
      detectionThreshold: 0.75,
      averageWindowDuration: 1000,
      minimumTimeBetweenSamples: 30,
      suppressionTime: 1500,
    );
  }

  Future<void> getResult() async {
    var results = await Future.wait([
      startRecognitionWithModel(
        modelPath: intendedSpeechPath,
        labelPath: intendedSpeechLabel,
        sampleRate: 16000,
        bufferSize: 2000,
        numOfInferences: 10,
      ),
      startRecognitionWithModel(
        modelPath: intendedNoisePath,
        labelPath: intendedNoiseLabel,
        sampleRate: 16000,
        bufferSize: 2000,
        numOfInferences: 10,
      ),
    ]);

    var result1 = results[0];
    var result2 = results[1];

    print(results);

    print('First recognition result: $result1');
    print('Second recognition result: $result2');

    result
        ?.listen((event) => print(
            "Recognition Result: " + event["recognitionResult"].toString()))
        .onDone(() => isRecording.value = false);
  }

  Future<Map<String, List<String>>> fetchLabelLists() async {
    List<String> intendedSpeechLabelList = [];
    List<String> intendedNoiseLabelList = [];

    await rootBundle.loadString(intendedSpeechLabel).then((q) {
      for (String line in const LineSplitter().convert(q)) {
        intendedSpeechLabelList.add(line.split(' ')[1]);
      }
    });

    await rootBundle.loadString(intendedNoiseLabel).then((q) {
      for (String line in const LineSplitter().convert(q)) {
        intendedNoiseLabelList.add(line.split(' ')[1]);
      }
    });

    return {
      'speechLabels': intendedSpeechLabelList,
      'noiseLabels': intendedNoiseLabelList,
    };
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
            body: StreamBuilder<Map<dynamic, dynamic>>(
                stream: result,
                builder: (BuildContext context,
                    AsyncSnapshot<Map<dynamic, dynamic>> inferenceSnapshot) {
                  return FutureBuilder<Map<String, List<String>>>(
                      future: fetchLabelLists(),
                      builder: (BuildContext context,
                          AsyncSnapshot<Map<String, List<String>>>
                              labelSnapshot) {
                        if (!labelSnapshot.hasData) {
                          return const CircularProgressIndicator();
                        }

                        List<String> speechLabels =
                            labelSnapshot.data!['speechLabels']!;
                        List<String> noiseLabels =
                            labelSnapshot.data!['noiseLabels']!;

                        switch (inferenceSnapshot.connectionState) {
                          case ConnectionState.none:
                            return labelListWidget(speechLabels);
                          case ConnectionState.waiting:
                            return Stack(children: <Widget>[
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: inferenceTimeWidget('calculating..')),
                              labelListWidget(speechLabels),
                            ]);
                          default:
                            return Stack(children: <Widget>[
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: inferenceTimeWidget(showResult(
                                          inferenceSnapshot, 'inferenceTime') +
                                      'ms')),
                              labelListWidget(
                                  speechLabels,
                                  showResult(
                                      inferenceSnapshot, 'recognitionResult'))
                            ]);
                        }
                      });
                }),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: ValueListenableBuilder(
                valueListenable: isRecording,
                builder: (context, value, widget) {
                  if (value == false) {
                    return FloatingActionButton(
                      onPressed: () {
                        isRecording.value = true;
                        setState(() {
                          getResult();
                        });
                      },
                      backgroundColor: Colors.blue,
                      child: const Icon(Icons.mic),
                    );
                  } else {
                    return FloatingActionButton(
                      onPressed: () {
                        print('Audio Recognition Stopped');
                        TfliteAudio.stopAudioRecognition();
                      },
                      backgroundColor: Colors.red,
                      child: const Icon(Icons.adjust),
                    );
                  }
                })));
  }

  Widget labelListWidget(List<String>? labelList, [String? result]) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: labelList!.map((labels) {
              if (labels == result) {
                return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(labels.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.green,
                        )));
              } else {
                return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(labels.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )));
              }
            }).toList()));
  }

  Widget inferenceTimeWidget(String result) {
    return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(result,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            )));
  }
}
