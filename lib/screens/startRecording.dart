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
      // Wrap with Scaffold
      backgroundColor:
          Theme.of(context).scaffoldBackgroundColor, // Optional: set background
      body: GeneralScreenPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Header(
              title: 'RECORDING',
              alignment: 'headerAlignment',
              textType: 'headerText',
            ),
            Label(text: 'Game Name'),
            Label(text: 'Date and Time Schedule'),

            // Pass the setter function to GameQuarter
            GameQuarter(onSelectQuarter: (quarter) {
              setState(() {
                selectedQuarter = quarter;
              });
            }),

            RecordingField(
              speech: 'test',
              type: 'inputSpeechFieldType',
              gameQuarter: '',
            ),
            RecordingButton(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
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
            Button(
              text: 'Team Profile',
              onPress: () {
                // Navigate to the Team Profile screen
                Navigator.pushNamed(context, '/screens/teamProfile');
              },
            ),
          ],
        ),
      ),
    );
  }
}
