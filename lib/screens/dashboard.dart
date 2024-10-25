import 'package:flutter/material.dart';
import 'package:capstone_two_one/services/game_data_service.dart';
import 'package:capstone_two_one/widgets/general_screen_padding.dart';
import 'package:capstone_two_one/widgets/header.dart';
import 'package:capstone_two_one/widgets/recording_button.dart';
import 'package:capstone_two_one/widgets/button.dart';
import 'package:capstone_two_one/widgets/game_card.dart'; // Import GameCard widget
import 'package:capstone_two_one/models/basketball_model.dart'; // Import Team and Game model

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late Future<List<Map<String, dynamic>>> _gameFuture;

  @override
  void initState() {
    super.initState();
    _gameFuture = DataService().loadGameData(); // Load simplified game data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: GeneralScreenPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Header(
              title: "DASHBOARD",
              alignment: "headerAlignment",
              textType: "headerText",
            ),
            const RecordingButton(text: "Start New Recording!"),
            const Header(
              title: "Games History",
              alignment: "sectionTitleAlignment",
              textType: "sectionTextType",
            ),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: _gameFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No games available.'));
                  } else {
                    final games = snapshot.data!;
                    return ListView.builder(
                      itemCount: games.length,
                      itemBuilder: (context, index) {
                        final game = games[index];

                        // Extract teams and date from game
                        final gameTitle = game['title'];
                        final teams = game['teams'] as List<String>;
                        final gameDate = DateTime.parse(game['date']);

                        // Map team names to Team objects
                        final teamObjects = teams
                            .map(
                                (teamName) => Team(name: teamName, players: []))
                            .toList();

                        return GameCard(
                          game: Game(
                            title: gameTitle,
                            teams: teamObjects,
                            date: gameDate,
                          ),
                          selectedStat:
                              null, // You can customize the selected stat here
                          onPress: () {
                            Navigator.pushNamed(
                              context,
                              '/screens/gameDetails',
                              arguments: game,
                            );
                          },
                        );
                      },
                    );
                  }
                },
              ),
            ),
            Button(
              text: 'Start New Recording',
              onPress: () {
                Navigator.pushNamed(context, '/screens/startRecording');
              },
            ),
          ],
        ),
      ),
    );
  }
}
