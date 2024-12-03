import 'package:flutter/material.dart';
import 'package:audio_classification/constants/colors.dart';
import 'package:audio_classification/services/service_methods.dart';
import 'package:audio_classification/widgets/customDrawer.dart';
import 'package:audio_classification/widgets/general_screen_padding.dart';
import 'package:audio_classification/widgets/header.dart';
import 'package:audio_classification/prisma/generated_dart_client/model.dart';

class PlayerProfile extends StatefulWidget {
  final Team? team;
  final String? teamName;
  const PlayerProfile({Key? key, this.team, this.teamName}) : super(key: key);

  @override
  _PlayerProfileState createState() => _PlayerProfileState();
}

class _PlayerProfileState extends State<PlayerProfile> {
  List<Player> _players = [];
  final serviceMethod = ServiceMethod();

  @override
  void initState() {
    super.initState();
    if (widget.team != null && widget.team!.id != null) {
      _fetchPlayersByTeamId(widget.team!.id ?? 0);
    } else {
      print('Error: Team is null or has no valid ID');
    }
  }

  Future<void> _fetchPlayersByTeamId(int teamId) async {
    try {
      List<Player> players = await serviceMethod.fetchPlayersByTeamId(teamId);
      setState(() {
        _players = players;
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
        color: Colors.white,
        child: GeneralScreenPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(
                title: "PLAYER PROFILE",
                alignment: HeaderAlignment.header,
                textType: TextType.header,
              ),
              Header(
                title: widget.teamName ?? "NO TEAM NAME",
                alignment: HeaderAlignment.header,
                textType: TextType.section,
              ),
              if (_players.isNotEmpty)
                Expanded(
                  child: ListView.builder(
                    itemCount: _players.length,
                    itemBuilder: (context, index) {
                      final player = _players[index];
                      return GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: AppColors.darkOrange, width: 3),
                          ),
                          margin: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            children: [
                              if (player != null) ...[
                                // Example player details
                                Text(
                                  "${player?.lastName?.toUpperCase() ?? 'No Last Name'}, ${player?.firstName ?? 'No First Name'}",
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  "Jersey Number:${player?.jerseyNumber}",
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.normal,
                                    fontSize: 18,
                                    color: AppColors.grey,
                                  ),
                                ),
                              ] else ...[
                                Text(
                                  'No Data Available',
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: AppColors.grey,
                                  ),
                                ),
                              ],
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
