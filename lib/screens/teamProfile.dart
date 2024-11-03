import 'package:audio_classification/widgets/customDrawer.dart';
import 'package:flutter/material.dart';

import 'package:audio_classification/models/basketball_model.dart';
import 'package:audio_classification/widgets/general_screen_padding.dart';
import 'package:audio_classification/widgets/header.dart';
import 'package:audio_classification/widgets/game_card.dart'; // Ensure GameCard widget exists
import 'package:audio_classification/widgets/button.dart';
import 'package:audio_classification/constants/colors.dart'; // Adjust the import path if necessary
import 'package:audio_classification/widgets/filterButton.dart';

class TeamProfile extends StatelessWidget {
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

            // Game card for the team
            GameCard(
              onPress: () {
                Navigator.pushNamed(
                  context,
                  '/screens/playerProfile',
                );
              },
              team: Team(name: 'Team Name'),
            ),

            // Uncomment if you want to display the team list in a scrollable view
            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 10),
            //     child: ListView.builder(
            //       itemCount: teamData.length, // Assuming teamData is a list of your team details
            //       itemBuilder: (context, index) {
            //         final team = teamData[index];
            //         return GameCard(
            //           team: {
            //             'teamName': team.teamName,
            //             'schoolYear': team.schoolYear,
            //             'gameName': team.gameName,
            //             'icon': SvgPicture.asset(
            //                 'assets/icons/eye.svg', // Replace with appropriate asset or use Feather directly
            //                 height: 30,
            //                 color: Colors.darkOrange,
            //               ),
            //           },
            //           onPress: () {
            //             Navigator.pushNamed(context, '/screens/teamPlayerProfile');
            //           },
            //         );
            //       },
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
