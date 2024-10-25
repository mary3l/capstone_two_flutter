// import 'package:flutter/material.dart';
// import 'package:capstone_two_one/widgets/general_screen_padding.dart';
// import 'package:capstone_two_one/widgets/header.dart';
// import 'package:capstone_two_one/widgets/label.dart';
// import 'package:capstone_two_one/widgets/game_card.dart'; // Adjust the import path as necessary
// import 'package:capstone_two_one/models/game_model.dart'; // Model for game and player statistics
// import 'dart:convert';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:capstone_two_one/widgets/statistic_category_selector.dart';
// import 'package:capstone_two_one/constants/stat_category.dart'; // Import your constants file

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

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white, // Set background color to white
//       child: GeneralScreenPadding(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Header for the screen
//             Header(
//               title: "PLAYER STATISTICS",
//               alignment: 'headerAlignment',
//               textType: 'headerText',
//             ),

//             // Static labels for game details
//             Label(text: "Team Name"),
//             Label(text: "Game Name"),
//             Label(text: "Date and Time Schedule"),

//             // Statistic category selection
//             StatCategorySelector(
//               onSelectCategory: (StatCategory category) {
//                 setState(() {
//                   selectedStat = category; // Update the selected stat
//                 });
//               },
//             ),

//             // Mapping over the games list to display player statistics
//             Expanded(
//               child: ListView.builder(
//                 itemCount: games.length,
//                 itemBuilder: (context, index) {
//                   final game = games[index];
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Display game name and other game info
//                       Text(
//                         game.title, // Use 'title' instead of 'gameName'
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         game.teams, // Display the team name
//                         style: TextStyle(fontStyle: FontStyle.italic),
//                       ),
//                       Text(
//                         game.date.toString(), // Display date and time
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                       SizedBox(height: 10), // Add spacing
//                       ListView.builder(
//                         shrinkWrap: true,
//                         physics:
//                             NeverScrollableScrollPhysics(), // Prevent scrolling of inner ListView
//                         itemCount: game.teams.isNotEmpty
//                             ? game.teams[0].players.length
//                             : 0,
//                         itemBuilder: (context, playerIndex) {
//                           final player = game.teams[0].players[
//                               playerIndex]; // Access players from the first team
//                           return GameCard(
//                             player: player,
//                             selectedStat: selectedStat,
//                           );
//                         },
//                       ),
//                       Divider(), // Add a divider between games
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
