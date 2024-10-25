import 'package:capstone_two_one/constants/colors.dart';
import 'package:capstone_two_one/models/basketball_model.dart';
import 'package:flutter/material.dart';
import 'package:capstone_two_one/constants/stat_category.dart';
import 'package:intl/intl.dart';

class GameCard extends StatelessWidget {
  final Game? game; // Game object
  final Player? player; // Player object
  final Team? team; // Team object
  final StatCategory? selectedStat; // Selected statistic category
  final VoidCallback? onPress; // Callback for onPress event

  const GameCard({
    Key? key,
    this.game,
    this.player,
    this.team,
    this.onPress,
    this.selectedStat,
  }) : super(key: key);

  // Function to get player's statistics based on the selected stat category for a specific game
  int getPlayerStatForGame(StatCategory? statCategory) {
    if (player == null || game == null || statCategory == null) return 0;

    // Fetch the player's game statistics for the specific game
    final gameStats = player!.statistics?.gameBreakdown;

    if (gameStats != null && gameStats.gameId == game!.gameId) {
      switch (statCategory) {
        case StatCategory.points:
          return gameStats.totalPoints ?? 0;
        case StatCategory.rebounds:
          return gameStats.totalRebounds ?? 0;
        case StatCategory.steal:
          return gameStats.totalSteals ?? 0;
        case StatCategory.block:
          return gameStats.totalBlocks ?? 0;
        case StatCategory.turnover:
          return gameStats.totalTurnovers ?? 0;
        case StatCategory.foul:
          return gameStats.totalFouls ?? 0;
        case StatCategory.assists:
          return gameStats.totalAssists ?? 0;
        default:
          return 0; // Return 0 for unrecognized stat category
      }
    }
    return 0; // Return 0 if no stats found for the game
  }

  @override
  Widget build(BuildContext context) {
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
                          game!.title ?? "No Game Title",
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColors.black, // Change color as needed
                          ),
                        ),
                        if (game!.teams != null && game!.teams!.isNotEmpty) ...[
                          Text(
                            game!.teams!.first.name ??
                                "No Team Name", // Only one team
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.grey,
                            ),
                          ),
                        ],
                        Text(
                          game!.date != null
                              ? DateFormat('MMMM dd, yyyy').format(game!.date!)
                              : "No date available",
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (game!.teams != null && game!.teams!.isNotEmpty) ...[
                    Icon(
                      Icons.remove_red_eye_outlined,
                      color: AppColors.darkOrange,
                      size: 35,
                    ),
                  ],
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
                          '${player!.lastName}, ${player!.firstName}',
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Player No. ${player!.jerseyNumber}',
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 10,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (player!.statistics?.gameBreakdown?.gameId ==
                      game?.gameId) ...[
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.darkOrange,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        '${getPlayerStatForGame(selectedStat)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
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
                      team!.name ?? "Team Name",
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  if (team!.players != null && team!.players!.isNotEmpty) ...[
                    Icon(Icons.group),
                  ],
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
