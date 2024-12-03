import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:audio_classification/constants/colors.dart';
import 'package:audio_classification/services/service_methods.dart';
import 'package:audio_classification/widgets/customDrawer.dart';
import 'package:audio_classification/widgets/general_screen_padding.dart';
import 'package:audio_classification/widgets/header.dart';
import 'package:audio_classification/prisma/generated_dart_client/model.dart';

class TeamStatistics extends StatefulWidget {
  final int? gameID;

  TeamStatistics({this.gameID = 1});

  @override
  _TeamStatisticsState createState() => _TeamStatisticsState();
}

class _TeamStatisticsState extends State<TeamStatistics> {
  List<PlayerStatistics> _playerStatistics = [];
  List<Player> _players = [];
  final serviceMethod = ServiceMethod();

  @override
  void initState() {
    super.initState();
    _fetchPlayerStatisticsByGameID();
  }

  Future<void> _fetchPlayerStatisticsByGameID() async {
    try {
      log("Fetching data for gameID: ${widget.gameID}");
      final playerStatistics =
          await serviceMethod.fetchPlayerStatisticsByGameID(widget.gameID!);
      log("Fetched Player Statistics: $playerStatistics");

      setState(() {
        _playerStatistics = playerStatistics;
      });
    } catch (e) {
      log("Error fetching player statistics: $e");
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(
                  title: "TEAM STATISTICS",
                  alignment: HeaderAlignment.header,
                  textType: TextType.header,
                ),
                const SizedBox(height: 20),

                // Team Stats Overview
                const Text(
                  "Team Overview",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 10),
                _buildTeamStatisticsGrid(),

                const SizedBox(height: 20),
                const Divider(color: AppColors.darkOrange, thickness: 2),
                const SizedBox(height: 10),

                // Player Statistics Section
                const Text(
                  "Player's Statistics",
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 10),
                _playerStatistics.isEmpty
                    ? const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            "No player statistics available.",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.grey,
                            ),
                          ),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _playerStatistics.length,
                        itemBuilder: (context, index) {
                          final stats = _playerStatistics[index];
                          return _buildPlayerStatisticsCard(stats);
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTeamStatisticsGrid() {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 300),
      child: GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 3,
        children: [
          _buildTeamStatsCard('Total Points', _calculateTeamTotal('points')),
          _buildTeamStatsCard('Rebounds', _calculateTeamTotal('rebounds')),
          _buildTeamStatsCard('Steals', _calculateTeamTotal('steals')),
          _buildTeamStatsCard('Blocks', _calculateTeamTotal('blocks')),
          _buildTeamStatsCard('Turnovers', _calculateTeamTotal('turnovers')),
          _buildTeamStatsCard('Fouls', _calculateTeamTotal('fouls')),
          _buildTeamStatsCard('Assists', _calculateTeamTotal('assists')),
        ],
      ),
    );
  }

  Widget _buildPlayerStatisticsCard(PlayerStatistics stats) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: AppColors.lightOrange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.darkOrange, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Player Name
          Text(
            "${stats.player?.lastName?.toUpperCase() ?? 'No Last Name'}, ${stats.player?.firstName ?? 'No First Name'}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 10),

          // Player Statistics
          _buildPlayerStatRow("1-Point Shots Made", stats.madeOne ?? 0),
          _buildPlayerStatRow("2-Point Shots Made", stats.madeTwo ?? 0),
          _buildPlayerStatRow("3-Point Shots Made", stats.madeThree ?? 0),
          _buildPlayerStatRow("Total Points", stats.totalScore ?? 0,
              isBold: true),
          const Divider(color: AppColors.darkOrange, thickness: 0.5),
          _buildPlayerStatRow("Assists", stats.assist ?? 0),
          _buildPlayerStatRow("Blocks", stats.block ?? 0),
          _buildPlayerStatRow("Fouls", stats.foul ?? 0),
          _buildPlayerStatRow("Steals", stats.steal ?? 0),
          _buildPlayerStatRow("Turnovers", stats.turnover ?? 0),
          _buildPlayerStatRow("Rebounds", stats.rebound ?? 0),
        ],
      ),
    );
  }

  Widget _buildPlayerStatRow(String title, int value, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            color: AppColors.black,
          ),
        ),
        Text(
          value.toString(),
          style: TextStyle(
            fontSize: 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: AppColors.darkOrange,
          ),
        ),
      ],
    );
  }

  int _calculateTeamTotal(String stat) {
    int total = 0;
    for (var playerStats in _playerStatistics) {
      switch (stat) {
        case 'points':
          total += (playerStats.totalScore ?? 0).toInt();
          break;
        case 'rebounds':
          total += (playerStats.rebound ?? 0).toInt();
          break;
        case 'steals':
          total += (playerStats.steal ?? 0).toInt();
          break;
        case 'blocks':
          total += (playerStats.block ?? 0).toInt();
          break;
        case 'turnovers':
          total += (playerStats.turnover ?? 0).toInt();
          break;
        case 'fouls':
          total += (playerStats.foul ?? 0).toInt();
          break;
        case 'assists':
          total += (playerStats.assist ?? 0).toInt();
          break;
        default:
          break;
      }
    }
    return total;
  }

  Widget _buildTeamStatsCard(String title, int value) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightOrange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.darkOrange, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          Text(
            value.toString(),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.darkOrange,
            ),
          ),
        ],
      ),
    );
  }
}
