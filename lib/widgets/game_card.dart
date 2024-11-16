import 'package:audio_classification/constants/colors.dart';
import 'package:audio_classification/prisma/generated_dart_client/model.dart';
import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  final Game? game; // Nullable Game object
  final Team? team; // Nullable Team object
  // final List<Team>? listTeams; // Nullable List of teams for this game
  final Player? player; // Nullable Player object
  final VoidCallback? onPress; // Nullable callback for tap
  final bool showStats; // Whether to show stats
  final bool
      againstTeam; // Flag to indicate if the player is playing against a team

  const GameCard({
    Key? key,
    this.game,
    this.team,
    // this.listTeams,
    this.player,
    this.onPress,
    this.showStats = false,
    this.againstTeam = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Handling nullable Game, Team, and Player objects
    String formattedDate = game != null
        ? "${game!.date!.year}-${game!.date!.month}-${game!.date!.day}" // Format game date
        : 'No Date Available'; // Default text if no date is available

    return GestureDetector(
      onTap: onPress, // Trigger the onPress callback when the card is tapped
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
            // If game data is available, display game details
            if (game != null) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Displaying the game title
                        Text(
                          game!.title ??
                              'No Game Title', // Fallback text if title is null
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: AppColors.black,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          game!.team!.name ??
                              'No Team Name', // Fallback text if team name is null
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: AppColors.grey,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          formattedDate, // Display formatted date
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
                  // Eye icon to view more details (common for all layouts)
                  Icon(
                    Icons.remove_red_eye_outlined,
                    color: AppColors.darkOrange,
                    size: 35,
                  ),
                ],
              ),
            ]
            // If player data is available, display player details
            else if (player != null) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          againstTeam
                              ? "${player!.lastName?.toUpperCase()}, ${player!.firstName}" // Player name if playing against a team
                              : 'Against Team', // Fallback text when not playing against a specific team
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColors.black,
                          ),
                        ),
                        Text(
                          againstTeam
                              ? 'Player No. 123' // Placeholder for player number
                              : 'Game Title - Date and Time Schedule', // Fallback text
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // If showStats is true, display stats
                  if (showStats) ...[
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.darkOrange,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        "0", // Placeholder for stats; replace with actual value
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ]
                  // Otherwise, show the eye icon
                  else ...[
                    Icon(
                      Icons.remove_red_eye_outlined,
                      color: AppColors.darkOrange,
                      size: 35,
                    ),
                  ],
                ],
              ),
            ]
            // If team data is available, display team details
            else if (team != null) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      team!.name ??
                          'No Team Available', // Fallback text if team is null
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.black,
                      ),
                    ),
                  ),
                  // Eye icon to view more details
                  Icon(
                    Icons.remove_red_eye_outlined,
                    color: AppColors.darkOrange,
                    size: 35,
                  ),
                ],
              ),
            ]
            // Default case when no game, player, or team is available
            else ...[
              Text(
                'No Data Available', // Fallback text for missing data
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
