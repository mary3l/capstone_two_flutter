import 'package:audio_classification/constants/colors.dart';
import 'package:audio_classification/widgets/customDrawer.dart';
import 'package:flutter/material.dart';
import 'package:audio_classification/widgets/general_screen_padding.dart';
import 'package:audio_classification/widgets/header.dart';
import 'package:audio_classification/widgets/recording_button.dart';
import 'package:audio_classification/widgets/button.dart';
import 'package:audio_classification/widgets/game_card.dart'; // Import GameCard widget
import 'package:audio_classification/models/test_basketball_model.dart'; // Import Team and Game model

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // Sample Game and Team Data
  final List<Game> games = [
    Game(
      gameID: 1,
      gameTitle: 'Championship Game',
      date: DateTime.now(),
      teamID: 1,
    ),
    Game(
      gameID: 2,
      gameTitle: 'Friendly Match',
      date: DateTime.now(),
      teamID: 2,
    ),
    Game(
      gameID: 3,
      gameTitle: 'Season Opener',
      date: DateTime.now(),
      teamID: 3,
    ),
  ];

  final List<Team> teams = [
    Team(teamID: 1, teamName: 'Team A'),
    Team(teamID: 2, teamName: 'Team B'),
    Team(teamID: 3, teamName: 'Team C')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightOrange,
      ),
      drawer: CustomDrawer(),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: GeneralScreenPadding(
        child: SingleChildScrollView(
          // Wrap the Column in a SingleChildScrollView
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
                  child: Button(
                    icon: Icon(Icons.mic, color: Colors.white),
                    text: 'Start Recording',
                    onPress: () {
                      Navigator.pushNamed(context, '/screens/startRecording');
                    },
                  ),
                ),
              ),
              SizedBox(height: 30), // Space below the RecordingButton

              const Header(
                title: "Games History",
                alignment: HeaderAlignment.sectionTitle,
                textType: TextType.section,
              ),
              SizedBox(height: 10), // Space below the Games History header

              // Use ListView.builder for dynamic rendering of games
              ListView.builder(
                shrinkWrap:
                    true, // Allows ListView to work inside SingleChildScrollView
                physics: NeverScrollableScrollPhysics(),
                itemCount: games.length,
                itemBuilder: (context, index) {
                  final game = games[index];
                  // final teams = [
                  //   Team(teamID: game.teamID),
                  // ];

                  return Column(
                    children: [
                      GameCard(
                        game: game,
                        listTeams: teams,
                        onPress: () {
                          Navigator.pushNamed(
                            context,
                            '/screens/teamStatistics',
                            arguments: game,
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
      ),
    );
  }
}
