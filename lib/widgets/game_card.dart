import 'package:audio_classification/constants/colors.dart';
import 'package:audio_classification/constants/stat_category.dart';
import 'package:audio_classification/prisma/generated_dart_client/model.dart';
import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  final Game? game;
  final Team? team;
  final Player? player;
  final PlayerStatistics? playerStatistics;
  final VoidCallback? onPress;
  final bool showStats;
  final bool againstTeam;
  final StatCategory? selectedStat;
  final String? season;
  final String? semester;

  const GameCard({
    Key? key,
    this.game,
    this.team,
    this.player,
    this.playerStatistics,
    this.selectedStat,
    this.onPress,
    this.showStats = false,
    this.againstTeam = false,
    this.season,
    this.semester,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate = game != null
        ? "${game!.date!.year}-${game!.date!.month}-${game!.date!.day}"
        : 'No Date Available';

    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.darkOrange, width: 3),
        ),
        margin: const EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            if (game != null) ...[
              GameDetails(game: game!, formattedDate: formattedDate),
            ] else if (player != null) ...[
              PlayerDetails(
                playerStatistics: playerStatistics!,
                selectedStat: selectedStat!,
              ),
            ] else if (team != null) ...[
              TeamDetails(
                team: team!,
                // seasonYear:
                //     '${game?.season?.startYear ?? 'N/A'} - ${game?.season?.endYear ?? 'N/A'}',
                semester: game?.semester ?? 'No Semester Available',
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
  }
}

class GameDetails extends StatelessWidget {
  final Game game;
  final String formattedDate;

  const GameDetails({
    Key? key,
    required this.game,
    required this.formattedDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                game.title ?? 'No Game Title',
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: AppColors.black,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                game.againstTeam ?? 'No Opponent Team Name',
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.normal,
                  fontSize: 14,
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                formattedDate,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        Icon(
          Icons.remove_red_eye_outlined,
          color: AppColors.darkOrange,
          size: 35,
        ),
      ],
    );
  }
}

class PlayerDetails extends StatelessWidget {
  final PlayerStatistics playerStatistics;
  final StatCategory selectedStat;

  const PlayerDetails({
    Key? key,
    required this.playerStatistics,
    required this.selectedStat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Player's name and jersey number
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${playerStatistics.player?.lastName?.toUpperCase() ?? 'No Last Name'}, ${playerStatistics.player?.firstName ?? 'No First Name'}",
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.black,
                    ),
                  ),
                  Text(
                    "Player Jersey No.${playerStatistics.player!.jerseyNumber}",
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      color: AppColors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        // Stats (Points, Rebounds, Steals, Blocks, Turnovers, Fouls, Assists)
        SizedBox(height: 10), // Add some spacing
        _buildStatRow('Points', playerStatistics.totalScore),
        _buildStatRow('Rebounds', playerStatistics.rebound),
        _buildStatRow('Steals', playerStatistics.steal),
        _buildStatRow('Blocks', playerStatistics.block),
        _buildStatRow('Turnovers', playerStatistics.turnover),
        _buildStatRow('Fouls', playerStatistics.foul),
        _buildStatRow('Assists', playerStatistics.assist),
      ],
    );
  }

  // Helper method to create a stat row
  Widget _buildStatRow(String statName, int? statValue) {
    return Row(
      children: [
        Text(
          "$statName: ${statValue ?? 0}",
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            color: AppColors.grey,
          ),
        ),
      ],
    );
  }
}

class TeamDetails extends StatelessWidget {
  final Team team;

  final String semester;

  const TeamDetails({
    Key? key,
    required this.team,
    required this.semester,
    // required this.seasonYear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            team.name ?? 'No Team Available',
            style: const TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: AppColors.black,
            ),
          ),
        ),
        Icon(
          Icons.remove_red_eye_outlined,
          color: AppColors.darkOrange,
          size: 35,
        ),
      ],
    );
  }
}
