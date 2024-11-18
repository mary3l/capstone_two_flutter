import 'package:audio_classification/widgets/customDrawer.dart';
import 'package:flutter/material.dart';
import 'package:audio_classification/widgets/general_screen_padding.dart';
import 'package:audio_classification/widgets/header.dart';
import 'package:audio_classification/widgets/label.dart';
import 'package:audio_classification/widgets/game_card.dart'; // Adjust the import path as necessary
import 'package:audio_classification/models/basketball_model.dart'; // Model for game and player statistics
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:audio_classification/widgets/statistic_category_selector.dart';
import 'package:audio_classification/constants/stat_category.dart'; // Import your constants file

class TeamPlayerProfile extends StatefulWidget {
  @override
  _TeamPlayerProfileState createState() => _TeamPlayerProfileState();
}

class _TeamPlayerProfileState extends State<TeamPlayerProfile> {
  // State to manage the selected statistic category
  StatCategory selectedStat = StatCategory.points;

  @override
  void initState() {
    super.initState();
  }

  List<PointsBreakdown> pointsBreakdownList = [
    PointsBreakdown(
      breakdownId: 1,
      madeOne: 3,
      madeTwo: 5,
      madeThree: 2,
      missOne: 1,
      missTwo: 0,
      missThree: 1,
      quarterID: 'Q1',
    ),
    PointsBreakdown(
      breakdownId: 2,
      madeOne: 2,
      madeTwo: 3,
      madeThree: 4,
      missOne: 1,
      missTwo: 2,
      missThree: 0,
      quarterID: 'Q2',
    ),
    // Add more breakdowns as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: CustomDrawer(),
      body: Container(
        color: Colors.white, // Set background color to white
        child: GeneralScreenPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header for the screen
              Header(
                title: "LASTNAME FIRSTNAME",
                alignment: HeaderAlignment.header,
                textType: TextType.header,
              ),
              Label(
                text: "Player No.",
                alignment: LabelAlignment.header,
              ),

              Label(text: "Team Name", alignment: LabelAlignment.sectionLabel),
              Label(
                  text: "School Year - First Semester",
                  alignment: LabelAlignment.sectionLabel),
              Label(
                  text: "Games Played:",
                  alignment: LabelAlignment.sectionLabel),

              // Statistic category selection
              StatCategorySelector(
                onSelectCategory: (StatCategory category) {
                  setState(() {
                    selectedStat = category; // Update the selected stat
                  });
                },
              ),
              Label(
                  text: "Total statCategory this season:",
                  alignment: LabelAlignment.sectionLabel),
            ],
          ),
        ),
      ),
    );
  }
}
