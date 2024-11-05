// import 'package:audio_classification/widgets/customDrawer.dart';
// import 'package:flutter/material.dart';
// import 'package:audio_classification/widgets/general_screen_padding.dart';
// import 'package:audio_classification/widgets/header.dart';
// import 'package:audio_classification/widgets/label.dart';
// import 'package:audio_classification/widgets/game_card.dart'; // Adjust the import path as necessary
// import 'package:audio_classification/models/basketball_model.dart'; // Model for game and player statistics
// import 'dart:convert';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:audio_classification/widgets/statistic_category_selector.dart';
// import 'package:audio_classification/constants/stat_category.dart'; // Import your constants file

// class TeamStatistics extends StatefulWidget {
//   @override
//   _TeamStatisticsState createState() => _TeamStatisticsState();
// }

// class _TeamStatisticsState extends State<TeamStatistics> {
//   // State to manage the selected statistic category
//   StatCategory selectedStat = StatCategory.points;
//   List<Game> games = []; // Updated to hold games instead of players

//   @override
//   void initState() {
//     super.initState();
//     loadTeamStatistics(); // Load team statistics
//   }

//   Future<void> loadTeamStatistics() async {
//     // Load team statistics from JSON
//     final String response =
//         await rootBundle.loadString('lib/data/allData.json');
//     final List<dynamic> data = json.decode(response);

//     // Extract games from the loaded data
//     setState(() {
//       games = data.map((gameJson) => Game.fromJson(gameJson)).toList();
//     });
//   }

//   List<PointsBreakdown> pointsBreakdownList = [
//     PointsBreakdown(
//       breakdownId: 1,
//       madeOne: 3,
//       madeTwo: 5,
//       madeThree: 2,
//       missOne: 1,
//       missTwo: 0,
//       missThree: 1,
//       quarterID: 'Q1',
//     ),
//     PointsBreakdown(
//       breakdownId: 2,
//       madeOne: 2,
//       madeTwo: 3,
//       madeThree: 4,
//       missOne: 1,
//       missTwo: 2,
//       missThree: 0,
//       quarterID: 'Q2',
//     ),
//     // Add more breakdowns as needed
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       drawer: CustomDrawer(),
//       body: Container(
//         color: Colors.white, // Set background color to white
//         child: GeneralScreenPadding(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Header for the screen
//               Header(
//                 title: "PLAYER STATISTICS",
//                 alignment: HeaderAlignment.header,
//                 textType: TextType.header,
//               ),
//               SizedBox(height: 20),

//               // Static labels for game details
//               Label(text: "Team Name", alignment: LabelAlignment.header),
//               SizedBox(height: 10),
//               Label(text: "Game Name", alignment: LabelAlignment.header),
//               SizedBox(height: 10),
//               Label(
//                   text: "Date and Time Schedule",
//                   alignment: LabelAlignment.header),
//               SizedBox(height: 20),

//               // Statistic category selection
//               StatCategorySelector(
//                 onSelectCategory: (StatCategory category) {
//                   setState(() {
//                     selectedStat = category; // Update the selected stat
//                   });
//                 },
//               ),
//               SizedBox(height: 20),

//               // Game card with spacing
//               GameCard(
//                 player: Player(
//                   lastName: 'lastname',
//                   firstName: 'firstname',
//                   jerseyNumber: 12,
//                   pointsBreakdown: pointsBreakdownList,
//                 ),
//               ),
//               SizedBox(height: 20),

//               // Uncomment and add spacing if using ListView for displaying games
//               // Expanded(
//               //   child: ListView.builder(
//               //     itemCount: games.length,
//               //     itemBuilder: (context, index) {
//               //       final game = games[index];
//               //       return Column(
//               //         crossAxisAlignment: CrossAxisAlignment.start,
//               //         children: [
//               //           Text(
//               //             game.title, // Use 'title' instead of 'gameName'
//               //             style: TextStyle(fontWeight: FontWeight.bold),
//               //           ),
//               //           SizedBox(height: 5),
//               //           Text(
//               //             game.teams, // Display the team name
//               //             style: TextStyle(fontStyle: FontStyle.italic),
//               //           ),
//               //           SizedBox(height: 5),
//               //           Text(
//               //             game.date.toString(), // Display date and time
//               //             style: TextStyle(color: Colors.grey),
//               //           ),
//               //           SizedBox(height: 10),
//               //           ListView.builder(
//               //             shrinkWrap: true,
//               //             physics:
//               //                 NeverScrollableScrollPhysics(), // Prevent scrolling of inner ListView
//               //             itemCount: game.teams.isNotEmpty
//               //                 ? game.teams[0].players.length
//               //                 : 0,
//               //             itemBuilder: (context, playerIndex) {
//               //               final player = game.teams[0].players[
//               //                   playerIndex]; // Access players from the first team
//               //               return GameCard(
//               //                 player: player,
//               //                 selectedStat: selectedStat,
//               //               );
//               //             },
//               //           ),
//               //           Divider(),
//               //         ],
//               //       );
//               //     },
//               //   ),
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
