import 'dart:developer';

import 'package:audio_classification/helper/prisma.dart';
import 'package:audio_classification/prisma/generated_dart_client/prisma.dart';
import 'package:audio_classification/services/service_methods.dart';
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
import 'package:audio_classification/constants/stat_category.dart';
import 'package:orm/orm.dart'; // Import your constants file

class TeamStatistics extends StatefulWidget {
  @override
  _TeamStatisticsState createState() => _TeamStatisticsState();
}

class _TeamStatisticsState extends State<TeamStatistics> {
  // State to manage the selected statistic category
  StatCategory selectedStat = StatCategory.points;
  List<Game> games = []; // Updated to hold games instead of players

  final serviceMethod = ServiceMethod();

  @override
  void initState() {
    super.initState();
  }
  // List<PointsBreakdown> pointsBreakdownList = [
  //   PointsBreakdown(
  //     breakdownId: 1,
  //     madeOne: 3,
  //     madeTwo: 5,
  //     madeThree: 2,
  //     missOne: 1,
  //     missTwo: 0,
  //     missThree: 1,
  //     quarterID: 'Q1',
  //   ),
  //   PointsBreakdown(
  //     breakdownId: 2,
  //     madeOne: 2,
  //     madeTwo: 3,
  //     madeThree: 4,
  //     missOne: 1,
  //     missTwo: 2,
  //     missThree: 0,
  //     quarterID: 'Q2',
  //   ),
  //   // Add more breakdowns as needed
  // ];

  void _createPlayerStatistics(
      List<String> _keywordCombinations, int quarterNumber, int gameID) async {
    String first = _keywordCombinations[0]; // Maps to playerID
    String second = _keywordCombinations[1]; // Maps to action
    String third = _keywordCombinations.length > 2
        ? _keywordCombinations[2]
        : null; // Maps to points

    try {
      // Fetch the relevant quarter
      final quarter = await prisma.quarter.findUnique(
        where: QuarterWhereUniqueInput(id: quarterNumber),
      );

      if (quarter == null) {
        log('Quarter with ID $quarterNumber not found.');
        return;
      }

      // Create PlayerStatistics entry
      await prisma.playerStatistics.create(
        data: PrismaUnion.$1(
          PlayerStatisticsCreateInput(
            player: first.isNotEmpty
                ? PlayerCreateNestedOneWithoutStatisticsInput(
                    connect: PlayerWhereUniqueInput(id: int.tryParse(first)),
                  )
                : null, // Handle cases where playerID is not provided
            game: gameID > 0
                ? GameCreateNestedOneWithoutStatisticsInput(
                    connect: GameWhereUniqueInput(id: gameID),
                  )
                : null, // Ensure gameID is valid
            quarter: QuarterCreateNestedOneWithoutStatisticsInput(
              connect: QuarterWhereUniqueInput(id: quarter.id),
            ),
            action: second,
            points:
                third != null && third.isNotEmpty ? int.tryParse(third) : null,
          ),
        ),
      );

      log('Successfully created PlayerStatistics: $first, $second, $third.');
    } catch (e) {
      print(e);
      log('Error creating PlayerStatistics: ${e.toString()}');
    } finally {
      _keywordCombinations.clear();
    }
  }

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
              //   player: Player(
              //     lastName: 'lastname',
              //     firstName: 'firstname',
              //     jerseyNumber: 12,
              //     pointsBreakdown: pointsBreakdownList,
              //   ),
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
