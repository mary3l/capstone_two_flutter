import 'package:audio_classification/constants/colors.dart';
import 'package:audio_classification/models/test_basketball_model.dart';
import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  final Game? game; // Game object
  final Team? team;
  final List<Team>? listTeams; // List of teams for this game
  final Player? player; // Player object
  final VoidCallback? onPress; // Optional callback for tap
  final bool showStats; // Whether to show stats
  final bool againstTeam; // Flag for against team

  const GameCard({
    Key? key,
    this.game,
    this.team,
    this.listTeams,
    this.player,
    this.onPress,
    this.showStats = false,
    this.againstTeam = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Convert the date to a readable format
    String formattedDate = game != null
        ? "${game!.date.year}-${game!.date.month}-${game!.date.day}"
        : '';

    // Find the team name using teamID
    String teamName = listTeams
            ?.firstWhere(
              (team) => team.teamID == game?.teamID,
              orElse: () => Team(teamID: 0, teamName: 'No Team Available'),
            )
            .teamName ??
        'No Team Available';

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
                          game!.gameTitle,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          teamName, // Display the team name here
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
                        Text(
                          againstTeam
                              ? "${player!.lastName?.toUpperCase()}, ${player!.firstName}"
                              : 'Against Team',
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColors.black,
                          ),
                        ),
                        Text(
                          againstTeam
                              ? 'Player No. 123' // Replace with actual player number
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
                  if (showStats) ...[
                    Container(
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
                    ),
                  ] else ...[
                    Icon(
                      Icons.remove_red_eye_outlined,
                      color: AppColors.darkOrange,
                      size: 35,
                    ),
                  ],
                ],
              ),
            ] else if (team != null) ...[
              // Team Card Layout
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      team?.teamName ?? 'No Team Available', // Handle null case
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
