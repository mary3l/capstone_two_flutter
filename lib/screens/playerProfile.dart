import 'package:audio_classification/constants/colors.dart';
import 'package:audio_classification/services/service_methods.dart';
import 'package:audio_classification/widgets/customDrawer.dart';
import 'package:flutter/material.dart';
import 'package:audio_classification/widgets/general_screen_padding.dart';
import 'package:audio_classification/widgets/header.dart';
import 'package:audio_classification/widgets/label.dart';
import 'package:audio_classification/widgets/game_card.dart'; // Adjust the import path as necessary
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:audio_classification/widgets/statistic_category_selector.dart';
import 'package:audio_classification/constants/stat_category.dart';
import 'package:audio_classification/prisma/generated_dart_client/model.dart';

class PlayerProfile extends StatefulWidget {
  final Team? team;
  final String? teamName;
  const PlayerProfile({Key? key, this.team, this.teamName}) : super(key: key);

  @override
  _PlayerProfileState createState() => _PlayerProfileState();
}

class _PlayerProfileState extends State<PlayerProfile> {
  // State to manage the selected statistic category
  StatCategory selectedStat = StatCategory.points;
  List<Game> games = [];
  List<Player> _players = [];
  final serviceMethod = ServiceMethod();

  @override
  void initState() {
    super.initState();
    // Safely handle nullable team
    if (widget.team != null && widget.team!.id != null) {
      _fetchPlayersByTeamId(widget.team!.id ?? 0);
    } else {
      // Handle null team, show error, or fallback UI
      print('Error: Team is null or has no valid ID');
    }
  }

  // Fetch players for the selected team
  Future<void> _fetchPlayersByTeamId(int teamId) async {
    try {
      List<Player> players = await serviceMethod.fetchPlayersByTeamId(teamId);
      setState(() {
        _players = players; // Update the state with fetched players
      });
    } catch (e) {
      print('Error fetching players: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightOrange,
      ),
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
                title: widget.teamName ?? "NO TEAM NAME", // Show team name
                alignment: HeaderAlignment.header,
                textType: TextType.section,
              ),

              // Displaying the list of players
              if (_players.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: _players.length,
                    itemBuilder: (context, index) {
                      final player = _players[index];
                      return Column(
                        children: [
                          GameCard(
                            player: player,
                            // onPress: () {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (context) => PlayerProfile(
                            //           team: team), // Pass team info
                            //     ),
                            //   );
                            // },
                          ),
                          SizedBox(height: 5),
                        ],
                      );
                    },
                  ),
                )
              else
                Center(child: Text("Data not available")),
            ],
          ),
        ),
      ),
    );
  }
}
