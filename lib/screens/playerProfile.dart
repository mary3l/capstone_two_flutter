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

class PlayerProfile extends StatefulWidget {
  @override
  _PlayerProfileState createState() => _PlayerProfileState();
}

class _PlayerProfileState extends State<PlayerProfile> {
  // State to manage the selected statistic category
  StatCategory selectedStat = StatCategory.points;
  List<Game> games = []; // Updated to hold games instead of players

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
                title: "PLAYER PROFILE",
                alignment: HeaderAlignment.header,
                textType: TextType.header,
              ),
              Header(
                title: "TEAM NAME",
                alignment: HeaderAlignment.header,
                textType: TextType.section,
              ),

              Label(
                  text: "School Year, First Semester",
                  alignment: LabelAlignment.header),
              Label(text: "Game Title", alignment: LabelAlignment.header),

              GameCard(
                showStats: true,
                onPress: () {
                  Navigator.pushNamed(
                    context,
                    '/screens/teamPlayerProfile',
                  );
                },
                player: Player(
                  lastName: 'lastname',
                  firstName: 'firstname',
                  jerseyNumber: 12,
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
