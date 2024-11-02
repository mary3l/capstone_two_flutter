import 'package:audio_classification/constants/colors.dart';
import 'package:audio_classification/models/basketball_model.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

class GameCard extends StatelessWidget {
  final Game? game; // Game object
  final Player? player; // Player object
  final Team? team; // Team object
  final VoidCallback? onPress; // Optional callback for tap
  final bool showStats;
  final bool againstTeam;

  const GameCard(
      {Key? key,
      this.game,
      this.player,
      this.team,
      this.onPress,
      this.showStats = false,
      this.againstTeam = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress, // Reference the onPress function
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
              // Game Card Layout
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Displaying the game title
                        Text(
                          game!.title ?? "Game Title",
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColors.black,
                          ),
                        ),
                        Text(
                          // game!.teams.map((team) => team.name).join(', ') ??
                          "Team Name",
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.grey,
                          ),
                        ),
                        Text(
                          // DateFormat('yMMMMd').format(game!.date) ??
                          "Game Date",
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
              ),
            ] else if (player != null) ...[
              // Player Card Layout
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (againstTeam) // Use if statement for conditional rendering
                          Text(
                            "${player!.lastName?.toUpperCase()}, ${player!.firstName}",
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColors.black,
                            ),
                          )
                        else // Add an else statement for the alternative case
                          Text(
                            'Against Team',
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppColors.black,
                            ),
                          ),
                        Text(
                          againstTeam
                              ? 'Player No. 123'
                              : 'Game Title - Date and Time Schedule',
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  showStats
                      ? Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: AppColors.darkOrange,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            "0", // Placeholder for stats; replace with actual value if available
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        )
                      : Icon(
                          Icons.remove_red_eye_outlined,
                          color: AppColors.darkOrange,
                          size: 35,
                        ),
                ],
              )
            ] else if (team != null) ...[
              // Team Card Layout
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      // team?.name ??
                      "Team Name",
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
              ),
            ],
          ],
        ),
      ),
    );
  }
}
