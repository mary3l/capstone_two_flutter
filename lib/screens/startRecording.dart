import 'package:capstone_two_one/widgets/customDrawer.dart';
import 'package:flutter/material.dart';
import 'package:capstone_two_one/widgets/general_screen_padding.dart';
import 'package:capstone_two_one/widgets/header.dart';
import 'package:capstone_two_one/widgets/label.dart';
import 'package:capstone_two_one/widgets/recording_button.dart';
import 'package:capstone_two_one/widgets/recording_field.dart';
import 'package:capstone_two_one/widgets/game_quarter.dart';
import 'package:capstone_two_one/widgets/button.dart';

class StartRecording extends StatefulWidget {
  @override
  _StartRecordingState createState() => _StartRecordingState();
}

class _StartRecordingState extends State<StartRecording> {
  // State to hold the selected quarter
  String? selectedQuarter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(),
      drawer: CustomDrawer(),
      body: GeneralScreenPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Header(
              title: 'RECORDING',
              alignment: HeaderAlignment.header,
              textType: TextType.header,
            ),

            Label(text: 'Game Name', alignment: LabelAlignment.header),

            Label(
              text: 'Date and Time Schedule',
              alignment: LabelAlignment.header,
            ),
            SizedBox(height: 10),

            // Pass the setter function to GameQuarter
            GameQuarter(onSelectQuarter: (quarter) {
              setState(() {
                selectedQuarter = quarter;
              });
            }),
            SizedBox(height: 10),

            RecordingField(
              speech: 'test',
              type: 'inputSpeechFieldType',
              gameQuarter: '',
            ),
            SizedBox(height: 20),
            Center(child: RecordingButton()),
            SizedBox(height: 10),

            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    RecordingField(
                      speech: 'test',
                      gameQuarter: selectedQuarter ?? '',
                      type: 'outputSpeechFieldType',
                    ),
                    SizedBox(height: 10),
                    RecordingField(
                      speech: 'test',
                      gameQuarter: selectedQuarter ?? '',
                      type: 'outputSpeechFieldType',
                    ),
                    RecordingField(
                      speech: 'test',
                      gameQuarter: selectedQuarter ?? '',
                      type: 'outputSpeechFieldType',
                    ),
                    RecordingField(
                      speech: 'test',
                      gameQuarter: selectedQuarter ?? '',
                      type: 'outputSpeechFieldType',
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
