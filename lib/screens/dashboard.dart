import 'package:capstone_two_one/models/game_model.dart';
import 'package:capstone_two_one/services/game_data_service.dart';
import 'package:capstone_two_one/widgets/game_card.dart';
import 'package:capstone_two_one/widgets/general_screen_padding.dart';
import 'package:capstone_two_one/widgets/recording_button.dart';
import 'package:flutter/material.dart';
import 'package:capstone_two_one/widgets/header.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late Future<List<Game>> _gamesFuture;

  @override
  void initState() {
    super.initState();
    _gamesFuture = loadGameData();
  }

  @override
  Widget build(BuildContext context) {
    return GeneralScreenPadding(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Use the Header widget for the title
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
            child: FutureBuilder<List<Game>>(
              future: loadGameData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('No games available.'));
                } else {
                  final games = snapshot.data!;
                  return ListView.builder(
                    itemCount: games.length,
                    itemBuilder: (context, index) {
                      final game = games[index];
                      return GameCard(
                        game: game,
                        onPress: () {
                          // Navigate to team statistics or another screen
                          Navigator.pushNamed(
                              context, '/screens/teamStatistics');
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
