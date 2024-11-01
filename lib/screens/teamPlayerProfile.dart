import 'package:capstone_two_one/widgets/customDrawer.dart';
import 'package:flutter/material.dart';
import 'package:capstone_two_one/widgets/general_screen_padding.dart';
import 'package:capstone_two_one/widgets/header.dart';
import 'package:capstone_two_one/widgets/label.dart';
import 'package:capstone_two_one/widgets/game_card.dart'; // Adjust the import path as necessary
import 'package:capstone_two_one/models/basketball_model.dart'; // Model for game and player statistics
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:capstone_two_one/widgets/statistic_category_selector.dart';
import 'package:capstone_two_one/constants/stat_category.dart'; // Import your constants file

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
              GameCard(
                againstTeam: true,
                showStats: true,
                // onPress: () {
                //   Navigator.pushNamed(
                //     context,
                //     '/screens/TeamPlayerProfile',
                //   );
                // },
                player: Player(
                  lastName: 'lastname',
                  firstName: 'firstname',
                  jerseyNumber: 12,
                  pointsBreakdown: pointsBreakdownList,
                ),
              ),
              // Mapping over the games list to display player statistics
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: games.length,
              //     itemBuilder: (context, index) {
              //       final game = games[index];
              //       return Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           // Display game name and other game info
              //           Text(
              //             game.title, // Use 'title' instead of 'gameName'
              //             style: TextStyle(fontWeight: FontWeight.bold),
              //           ),
              //           Text(
              //             game.teams, // Display the team name
              //             style: TextStyle(fontStyle: FontStyle.italic),
              //           ),
              //           Text(
              //             game.date.toString(), // Display date and time
              //             style: TextStyle(color: Colors.grey),
              //           ),
              //           SizedBox(height: 10), // Add spacing
              //           ListView.builder(
              //             shrinkWrap: true,
              //             physics:
              //                 NeverScrollableScrollPhysics(), // Prevent scrolling of inner ListView
              //             itemCount: game.teams.isNotEmpty
              //                 ? game.teams[0].players.length
              //                 : 0,
              //             itemBuilder: (context, playerIndex) {
              //               final player = game.teams[0].players[
              //                   playerIndex]; // Access players from the first team
              //               return GameCard(
              //                 player: player,
              //                 selectedStat: selectedStat,
              //               );
              //             },
              //           ),
              //           Divider(), // Add a divider between games
              //         ],
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}