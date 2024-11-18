import 'package:audio_classification/constants/colors.dart';
import 'package:audio_classification/prisma/generated_dart_client/model.dart';
import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  final Game? game;
  final Team? team;
  final Player? player;
  final VoidCallback? onPress;
  final bool showStats;
  final bool againstTeam;
  final String? season;
  final String? semester;

  const GameCard({
    Key? key,
    this.game,
    this.team,
    this.player,
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
              PlayerDetails(player: player!),
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
  final Player player;

  const PlayerDetails({
    Key? key,
    required this.player,
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
                "${player.lastName?.toUpperCase()}, ${player.firstName}",
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: AppColors.black,
                ),
              ),
              Text(
                "${player.jerseyNumber}",
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  color: AppColors.grey,
                ),
              ),
            ],
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

class TeamDetails extends StatelessWidget {
  final Team team;
  // final String seasonYear;
  // final String startYear;
  // final String endYear;
  final String semester;

  const TeamDetails({
    Key? key,
    required this.team,
    // required this.startYear,
    // required this.endYear,
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
        // Expanded(
        //   child: Text(
        //     '$startYear - $endYear',
        //     style: const TextStyle(
        //       fontFamily: 'Inter',
        //       fontSize: 14,
        //       color: AppColors.grey,
        //     ),
        //   ),
        // ),
        // Expanded(
        //   child: Text(
        //     semester ?? 'No Semester Available',
        //     style: const TextStyle(
        //       fontFamily: 'Inter',
        //       fontSize: 14,
        //       color: AppColors.grey,
        //     ),
        //   ),
        // ),
        Icon(
          Icons.remove_red_eye_outlined,
          color: AppColors.darkOrange,
          size: 35,
        ),
      ],
    );
  }
}
