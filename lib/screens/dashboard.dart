import 'package:audio_classification/widgets/customDrawer.dart';
import 'package:flutter/material.dart';
import 'package:audio_classification/services/game_data_service.dart';
import 'package:audio_classification/widgets/general_screen_padding.dart';
import 'package:audio_classification/widgets/header.dart';
import 'package:audio_classification/widgets/recording_button.dart';
import 'package:audio_classification/widgets/button.dart';
import 'package:audio_classification/widgets/game_card.dart'; // Import GameCard widget
import 'package:audio_classification/models/basketball_model.dart'; // Import Team and Game model

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();

  final VoidCallback onStartRecording;

  const Dashboard({Key? key, required this.onStartRecording}) : super(key: key);
}

class _DashboardState extends State<Dashboard> {
  // late Future<List<Map<String, dynamic>>> _gameFuture;

  @override
  // void initState() {
  //   super.initState();
  //   // _gameFuture = DataService().loadGameData(); // Load simplified game data
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: CustomDrawer(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: GeneralScreenPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Header(
              title: "DASHBOARD",
              alignment: HeaderAlignment.header,
              textType: TextType.header,
            ),
            SizedBox(height: 20), // Space below the header

            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/screens/startRecording');
                },
                /* child: RecordingButton(
                  /onStartRecording: () async => await _startRecorder(),
                ), */
              ),
            ),
            SizedBox(height: 30), // Space below the RecordingButton

            const Header(
              title: "Games History",
              alignment: HeaderAlignment.sectionTitle,
              textType: TextType.section,
            ),
            SizedBox(height: 10), // Space below the Games History header

            GameCard(
              onPress: () {
                Navigator.pushNamed(
                  context,
                  '/screens/teamStatistics',
                );
              },
              game: Game(
                title: 'Sample Game Title',
                teams: [
                  Team(name: 'Team A', players: []),
                  Team(name: 'Team B', players: []),
                ],
                date: DateTime.now(),
              ),
            ),
            SizedBox(height: 20), // Space below the GameCard

            // Expanded(

            // child: FutureBuilder<List<Map<String, dynamic>>>(
            //   future: _gameFuture,
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       return const Center(child: CircularProgressIndicator());
            //     } else if (snapshot.hasError) {
            //       return Center(child: Text('Error: ${snapshot.error}'));
            //     } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            //       return const Center(child: Text('No games available.'));
            //     } else {
            //       final games = snapshot.data!;
            //       return ListView.builder(
            //         itemCount: games.length,
            //         itemBuilder: (context, index) {
            //           final game = games[index];

            //           // Extract teams and date from game
            //           final gameTitle = game['title'];
            //           final teams = game['teams'] as List<String>;
            //           final gameDate = DateTime.parse(game['date']);

            //           // Map team names to Team objects
            //           final teamObjects = teams
            //               .map(
            //                   (teamName) => Team(name: teamName, players: []))
            //               .toList();

            //           return GameCard(
            //             game: Game(
            //               title: gameTitle,
            //               teams: teamObjects,
            //               date: gameDate,
            //             ),
            //             selectedStat:
            //                 null, // You can customize the selected stat here
            //             onPress: () {
            //               Navigator.pushNamed(
            //                 context,
            //                 '/screens/gameDetails',
            //                 arguments: game,
            //               );
            //             },
            //           );
            //         },
            //       );
            //     }
            //   },
            // ),
            // ),
          ],
        ),
      ),
    );
  }
}
