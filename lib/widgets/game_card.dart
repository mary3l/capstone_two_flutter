import 'package:capstone_two_one/constants/colors.dart';
import 'package:capstone_two_one/constants/fonts.dart';
import 'package:capstone_two_one/models/game_model.dart';
import 'package:flutter/material.dart';

class GameCard extends StatelessWidget {
  final Game? game; // Game types
  final Player? player; // Player types
  final Team? team; // Team types
  final String? selectedStat; // Selected statistic
  final VoidCallback? onPress; // Callback for onPress event

  const GameCard({
    Key? key,
    this.game,
    this.player,
    this.team,
    this.onPress,
    this.selectedStat,
  }) : super(key: key);

  // Function to get player's statistic based on the selected stat
  int getPlayerStat(String statCategory) {
    // Check if player is not null and access statistics safely
    return player?.statisticsCount[statCategory] ?? 0;
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
                        Text(
                          game!.gameName.toUpperCase(), // Updated for uppercase
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          game!.teamName,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: AppColors.grey,
                          ),
                        ),
                        Text(
                          game!.dateAndTimeSchedule,
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 10,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (game!.icon != null) ...[
                    game!.icon!,
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
                          'Player No. ${player!.playerJerseyNumber}',
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 10,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (player!.icon != null) ...[
                    player!.icon!,
                  ] else ...[
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.darkOrange,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        // Check if selectedStat is not null
                        '${getPlayerStat(selectedStat ?? "")}', // Safe call for selectedStat
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
                      team!.teamName,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  if (team!.icon != null) ...[
                    team!.icon!,
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
