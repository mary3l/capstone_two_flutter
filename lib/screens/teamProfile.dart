import 'package:audio_classification/widgets/customDrawer.dart';
import 'package:flutter/material.dart';

import 'package:audio_classification/models/test_basketball_model.dart';
import 'package:audio_classification/widgets/general_screen_padding.dart';
import 'package:audio_classification/widgets/header.dart';
import 'package:audio_classification/widgets/game_card.dart'; // Ensure GameCard widget exists
import 'package:audio_classification/widgets/button.dart';
import 'package:audio_classification/constants/colors.dart'; // Adjust the import path if necessary
import 'package:audio_classification/widgets/filterButton.dart';

class TeamProfile extends StatelessWidget {
  // Sample Game and Team Data
  final List<Team> teams = [
    Team(teamID: 1, teamName: 'Team A'),
    Team(teamID: 2, teamName: 'Team B'),
    Team(teamID: 3, teamName: 'Team C'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: CustomDrawer(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: GeneralScreenPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main header for team profile
            Header(
              title: 'TEAM PROFILE',
              alignment: HeaderAlignment.header,
              textType: TextType.header,
            ),
            SizedBox(height: 12),

            // Subheader for filter section
            Header(
              title: 'Filter:',
              alignment: HeaderAlignment.sectionTitle,
              textType: TextType.section,
            ),
            SizedBox(height: 10),

            // Filter buttons
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                filterButton(title: 'School Year'),
                filterButton(title: 'First Semester'),
                filterButton(title: 'Game Name'),
              ],
            ),
            SizedBox(height: 20),

            ListView.builder(
              shrinkWrap:
                  true, // Allows ListView to work inside SingleChildScrollView
              physics: NeverScrollableScrollPhysics(),
              itemCount: teams.length,
              itemBuilder: (context, index) {
                final team = teams[index];

                return Column(
                  children: [
                    GameCard(
                      team: team,
                      onPress: () {
                        Navigator.pushNamed(
                          context,
                          '/screens/teamPlayerProfile',
                          arguments: team,
                        );
                      },
                    ),
                    SizedBox(height: 5),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
