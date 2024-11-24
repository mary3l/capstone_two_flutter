import 'dart:developer';

import 'package:audio_classification/helper/prisma.dart';
import 'package:audio_classification/prisma/generated_dart_client/prisma.dart';
import 'package:audio_classification/services/service_methods.dart';
import 'package:audio_classification/widgets/customDrawer.dart';
import 'package:flutter/material.dart';
import 'package:audio_classification/widgets/general_screen_padding.dart';
import 'package:audio_classification/widgets/header.dart';
import 'package:audio_classification/widgets/label.dart';
import 'package:audio_classification/widgets/game_card.dart'; // Adjust the import path as necessary // Model for game and player statistics
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:audio_classification/widgets/statistic_category_selector.dart';
import 'package:audio_classification/constants/stat_category.dart';
import 'package:orm/orm.dart'; // Import your constants file
import 'package:audio_classification/prisma/generated_dart_client/model.dart';

class TeamStatistics extends StatefulWidget {
  @override
  _TeamStatisticsState createState() => _TeamStatisticsState();
}

class _TeamStatisticsState extends State<TeamStatistics> {
  // State to manage the selected statistic category
  StatCategory selectedStat = StatCategory.points;
  List<Game> games = []; // Updated to hold games instead of players
  List<PlayerStatistics> _playerStatistics = [];

  final serviceMethod = ServiceMethod();

  @override
  void initState() {
    super.initState();
  }

  // Fetch player's statistics based on gameID
  // Future<void> _fetchPlayerStatisticsByGameID() async {
  //   if (widget.selectedSeasonID != null) {
  //     try {
  //       final games =
  //           await serviceMethod.fetchGamesBySeasonID(widget.selectedSeasonID!);
  //       setState(() {
  //         _games = games; // Update the _games list with the fetched games
  //       });
  //     } catch (e) {
  //       print("Error fetching games: $e");
  //     }
  //   }
  // }

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
                title: "PLAYER STATISTICS",
                alignment: HeaderAlignment.header,
                textType: TextType.header,
              ),
              SizedBox(height: 20),

              // Static labels for game details
              Label(text: "Team Name", alignment: LabelAlignment.header),
              SizedBox(height: 10),
              Label(text: "Game Name", alignment: LabelAlignment.header),
              SizedBox(height: 10),
              Label(
                  text: "Date and Time Schedule",
                  alignment: LabelAlignment.header),
              SizedBox(height: 20),

              // Statistic category selection
              StatCategorySelector(
                onSelectCategory: (StatCategory category) {
                  setState(() {
                    selectedStat = category; // Update the selected stat
                  });
                },
              ),
              SizedBox(height: 20),

              // Game card with spacing
              // GameCard(
              //   player: Player(lastName: ),
              // ),
              SizedBox(height: 20),

              // Uncomment and add spacing if using ListView for displaying games
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: games.length,
              //     itemBuilder: (context, index) {
              //       final game = games[index];
              //       return Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text(
              //             game.title, // Use 'title' instead of 'gameName'
              //             style: TextStyle(fontWeight: FontWeight.bold),
              //           ),
              //           SizedBox(height: 5),
              //           Text(
              //             game.teams, // Display the team name
              //             style: TextStyle(fontStyle: FontStyle.italic),
              //           ),
              //           SizedBox(height: 5),
              //           Text(
              //             game.date.toString(), // Display date and time
              //             style: TextStyle(color: Colors.grey),
              //           ),
              //           SizedBox(height: 10),
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
              //           Divider(),
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
