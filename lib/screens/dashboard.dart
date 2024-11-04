import 'package:audio_classification/widgets/customDrawer.dart';
import 'package:flutter/material.dart';
import 'package:audio_classification/widgets/general_screen_padding.dart';
import 'package:audio_classification/widgets/header.dart';
import 'package:audio_classification/widgets/recording_button.dart';
import 'package:audio_classification/widgets/button.dart';
import 'package:audio_classification/widgets/game_card.dart'; // Import GameCard widget
import 'package:audio_classification/models/test_basketball_model.dart'; // Import Team and Game model
import 'package:audio_classification/widgets/button.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();

  const Dashboard({Key? key}) : super(key: key);
}

class _DashboardState extends State<Dashboard> {
  // Sample Game and Team Data
  final Game game = Game(
    gameID: 1,
    gameTitle: 'Championship Game',
    date: DateTime.now(),
  );

  final List<Team> teams = [Team(teamID: 1, teamName: 'Lions')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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

              // Display the GameCard with sample data
              GameCard(
                game: game, // Pass the game object
                teams: teams, // Pass the list of teams
                onPress: () {
                  Navigator.pushNamed(
                    context,
                    '/screens/teamStatistics',
                    arguments: game, // Pass game data for navigation
                  );
                },
              ),
              SizedBox(height: 20), // Space below the GameCard

              // FutureBuilder or other widgets can go here as needed
            ],
          ),
        ),
      ),
    );
  }
}
