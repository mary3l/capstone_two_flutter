import 'package:audio_classification/constants/colors.dart';
import 'package:audio_classification/prisma/generated_dart_client/prisma.dart';
import 'package:audio_classification/services/service_methods.dart';
import 'package:audio_classification/widgets/customDrawer.dart';
import 'package:flutter/material.dart';
import 'package:audio_classification/widgets/general_screen_padding.dart';
import 'package:audio_classification/widgets/header.dart';
import 'package:audio_classification/widgets/label.dart';
import 'package:audio_classification/widgets/recording_button.dart';
import 'package:audio_classification/widgets/recording_field.dart';
import 'package:audio_classification/widgets/game_quarter.dart';
import 'package:audio_classification/widgets/button.dart';
import 'package:audio_classification/helper/prisma.dart';

import 'package:audio_classification/helper/classification_list_helper.dart';

import 'package:audio_classification/helper/audio_classification_helper.dart';
import 'dart:async';
import 'dart:developer';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:orm/orm.dart';

class StartRecording extends StatefulWidget {
  final String? gameTitle;
  final DateTime? date;
  final String? semester;
  final int? teamID;
  final int? startYear;
  final int? endYear;
  final int? seasonID;
  final String? opponentName;
  final int? gameID; // Add gameID here

  const StartRecording({
    Key? key,
    this.gameTitle,
    this.date,
    this.semester,
    this.teamID,
    this.startYear,
    this.endYear,
    this.seasonID,
    this.opponentName,
    this.gameID, // Add gameID to the constructor
  }) : super(key: key);

  @override
  _StartRecordingState createState() => _StartRecordingState();
}

class _StartRecordingState extends State<StartRecording> {
  final serviceMethod = ServiceMethod();
  // Declare the state for isValidCombination, initially null
  bool? isValidCombination;

  List<String> keywordCombinations = []; // Store keyword combinations here

  // State to hold the selected quarter
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
  bool _isValidKeywordCombination = false;

  List<String> _keywordCombinations = List.empty(growable: true);

  Future<void> _startRecorder() async {
    print('Starting recording');
    try {
      platform.invokeMethod('startRecord');
      if (_hasPermission) {
        _isRecording.value = true;
        Timer.periodic(
          const Duration(milliseconds: _expectAudioLength),
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
    _checkKeyWordCombinations(_keywordCombinations);
    _keywordCombinations.clear();
  }

  void printKeywordCombinationStatus() {
    log('isValidCombination: $isValidCombination');
    log('Current Keyword Combinations: $_keywordCombinations');
  }

  void _checkKeyWordCombinations(List<String> _keywordCombinations) {
    keywordList = KeywordList();
    _isValidKeywordCombination = keywordList.matches(_keywordCombinations);

    setState(
        () {}); // Ensure the UI updates after checking the keyword combination

    // Call the print method to log the status
    printKeywordCombinationStatus();

    // Once the combination is checked, proceed to process the keyword

    // Check if the combination is valid or invalid
    if (_isValidKeywordCombination) {
      // If the combination is valid, process the keyword as valid
      log('Valid keyword combination: $_keywordCombinations');
      _processKeyWord(_keywordCombinations); // Valid combination processing
    } else {
      // If the combination is invalid, log the invalid combination as invalid
      log('Invalid keyword combination: $_keywordCombinations');
      _processKeyWord(
          _keywordCombinations); // Still logs the invalid keyword combination in the table
    }
    _processKeyWord(_keywordCombinations);
    _keywordCombinations.clear();
  }

  void _processKeyWord(List<String> _keywordCombinations) {
    _createLog(_keywordCombinations, 1);
  }

  void _createLog(List<String> _keywordCombinations, int quarterNumber) async {
    String first = _keywordCombinations[0];
    String second = _keywordCombinations[1];
    String third = _keywordCombinations[2];
    try {
      final quarter = await prisma.quarter.findMany();
      for (var quarter in quarter) {
        print('Quarter ID: ${quarter.id}');
      }

      await prisma.logs.create(
        data: PrismaUnion.$1(
          LogsCreateInput(
            quarter: QuarterCreateNestedOneWithoutLogsInput(
              connect: (QuarterWhereUniqueInput(id: quarterNumber)),
            ),
            keywordOne: first,
            keywordTwo: second,
            keywordThree: third.isNotEmpty
                ? PrismaUnion.$1(third)
                : const PrismaUnion.$2(PrismaNull()),
            timestamp: DateTime.now(),
            isValidCombination: _isValidKeywordCombination,
          ),
        ),
      );
      log('Successfully created logs');
    } catch (e) {
      print(e);
      log('Error ${e.toString()}');
    } finally {
      _keywordCombinations.clear();
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
    /* NEW CUSTOM MODEL */
/*     const _modelSpeechPath =
        'assets/models/intended-speech/custom-intended-speech.tflite';
    const _modelSpeechlabelsPath =
        'assets/models/intended-speech/custom-intended-speech_labels.txt';
    const _modelSpeechSize = 22;

    const _modelNoisePath =
        'assets/models/intended-noise/custom-intended-noise.tflite';
    const _modelNoiselabelsPath =
        'assets/models/intended-noise/custom-intended-noise_labels.txt';
    const _modelNoiseSize = 6; */

    /*OLD GTM models*/
/*     const _modelSpeechPath =
        'assets/models/intended-speech/old-gtm-intended-speech.tflite';
    const _modelSpeechlabelsPath =
        'assets/models/intended-speech/old-gtm-intended-speech_labels.txt';
    const _modelSpeechSize = 20;

    const _modelNoisePath =
        'assets/models/intended-noise/old-gtm-intended-noise.tflite';
    const _modelNoiselabelsPath =
        'assets/models/intended-noise/old-gtm-intended-noise_labels.txt';
    const _modelNoiseSize = 7; */

    /* LIMITED GTM MODELS*/
/*     const _modelSpeechPath =
        'assets/models/intended-speech/gtm-limited-speech.tflite';
    const _modelSpeechlabelsPath =
        'assets/models/intended-speech/gtm-limited-speech_labels.txt'; 
        const _modelSpeechSize = 7;
             
        const _modelNoisePath =
        'assets/models/intended-noise/gtm-intended-noise.tflite';
    const _modelNoiselabelsPath =
        'assets/models/intended-noise/gtm-intended-noise_labels.txt';
    const _modelNoiseSize = 6;
        */

    /* Combined Model*/
    const _modelSpeechPath =
        'assets/models/combined-model/combined_model.tflite';
    const _modelSpeechlabelsPath =
        'assets/models/combined-model/combined_model_labels.txt';
    const _modelSpeechSize = 27;

    _helperSpeech = AudioClassificationHelper(
      _modelSpeechPath,
      _modelSpeechlabelsPath,
      _modelSpeechSize,
    );
    /* _helperNoise = AudioClassificationHelper(
        _modelNoisePath, _modelNoiselabelsPath, _modelNoiseSize); */
    await _helperSpeech.initHelper();
/*     await _helperNoise.initHelper(); */
    _hasPermission = await _requestPermission();
  }

  Future<void> _runInference() async {
    Float32List inputArray = await _getAudioFloatArray();

    // Adjust the input array to match your model's input tensor
    final resultSpeech = await _helperSpeech
        .inference(inputArray.sublist(0, _requiredInputBuffer));
/*     final resultNoise = await _helperNoise
        .inference(inputArray.sublist(0, _requiredInputBuffer)); */
    _VoteBetweenModels(resultSpeech);
  }

  void _VoteBetweenModels(resultSpeech) {
    _classificationSpeech = [
      (resultSpeech.entries as Iterable<MapEntry<String, double>>)
          .reduce((a, b) => a.value > b.value ? a : b)
    ];
    biggestValue = _classificationSpeech;
/*     _classificationNoise = [
      (resultNoise.entries as Iterable<MapEntry<String, double>>)
          .reduce((a, b) => a.value > b.value ? a : b)
    ]; */

/*     if (_classificationSpeech[0].value > _classificationNoise[0].value) {
      biggestValue = _classificationSpeech; // Speech classification wins
    } else {
      biggestValue = _classificationNoise; // Noise classification wins
    }
    print(biggestValue);
 */
    if (_keywordCombinations.length < 4) {
      _keywordCombinations.add(biggestValue[0].key);
    } else {
      _keywordCombinations.removeAt(0);
      log('Keywords: $_keywordCombinations');
      _stopRecorder();
    }

    //_createLog(_keywordCombinations, selectedQuarter as int);

    setState(() {
      biggestValue = biggestValue;
    });
  }

  @override
  void dispose() {
    _closeRecorder();
    super.dispose();
  }

  String? selectedQuarter;

  @override
  Widget build(BuildContext context) {
    // Retrieve the arguments passed from the previous screen
    /* final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String gameTitle = args['gameTitle'];
    final DateTime date = args['date'];
    final String semester =
        args['semester'] ?? 'N/A';  */
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.lightOrange,
      ),
      drawer: CustomDrawer(),
      body: GeneralScreenPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Header(
              title: 'RECORDING',
              alignment: HeaderAlignment.header,
              textType: TextType.header,
            ),

            /*  Label(
                text: 'Game Name: $gameTitle',
                alignment: LabelAlignment.header),
            Label(
              text:
                  'Date and Time Schedule: ${date.toLocal().toString().split(' ')[0]}', // Format the date if needed
              alignment: LabelAlignment.header,
            ),

            Label(
              text: widget.opponentName != null
                  ? 'Against Team: ${widget.opponentName}'
                  : 'Against Name: Not available',
              alignment: LabelAlignment.header,
            ), */
            const SizedBox(height: 10),

            Text(keywordCombinations.isEmpty
                ? ''
                : '${keywordCombinations[0]}-${keywordCombinations[1]}-${keywordCombinations[2]}'),

            // Pass the setter function to GameQuarter
            GameQuarter(onSelectQuarter: (quarter) {
              setState(() {
                selectedQuarter = quarter;
              });
            }),
            const SizedBox(height: 10),
            Text(biggestValue.toString()),

            RecordingField(
              speech: _keywordCombinations.join('-'),
              type: 'inputSpeechFieldType',
              gameQuarter: '',
              isValidCombination:
                  _isValidKeywordCombination, // Pass the validity here
            ),
            const SizedBox(height: 20),
            Center(
              child: RecordingButton(
                onStartRecording: () async => await _startRecorder(),
              ),
            ),
            const SizedBox(height: 10),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    RecordingField(
                      speech: _keywordCombinations.join('-'),
                      gameQuarter: selectedQuarter ?? '',
                      type: 'outputSpeechFieldType',
                      isValidCombination:
                          _isValidKeywordCombination, // Pass the validity here
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
