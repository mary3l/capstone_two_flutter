import 'dart:developer';

import 'package:audio_classification/helper/prisma.dart';
import 'package:audio_classification/prisma/generated_dart_client/prisma.dart';
import 'package:audio_classification/screens/playerProfile.dart';
import 'package:flutter/material.dart';

import 'package:audio_classification/screens/playerProfile.dart';
import 'package:audio_classification/screens/teamProfile.dart';
import 'package:audio_classification/screens/teamStatistics.dart';
import 'package:audio_classification/screens/startRecording.dart';
import 'package:audio_classification/screens/dashboard.dart';
import 'package:audio_classification/screens/landing.dart';
import 'package:orm/orm.dart';
import 'package:audio_classification/screens/teamPlayerProfile.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sqflite/sqflite.dart';

void loadPackageInfo() async {
  final packageInfo = await PackageInfo.fromPlatform();

  // Print app information to the terminal
  print("App Name: ${packageInfo.appName}");
  print("Package Name: ${packageInfo.packageName}");
  print("Version: ${packageInfo.version}");
  print("Build Number: ${packageInfo.buildNumber}");
}

void seedData() async {
  // try {
  //   await prisma.season.create(
  //     data: const PrismaUnion.$1(
  //       SeasonCreateInput(
  //         startYear: 2021,
  //         endYear: 2022,
  //       ),
  //     ),
  //   );
  //   log('Seed: Successfully created season');
  // } catch (e) {
  //   log('Seed: Failed to create season');
  // }

  // try {
  //   await prisma.team.create(
  //     data: const PrismaUnion.$1(
  //       TeamCreateInput(
  //         name: 'TeamA',
  //       ),
  //     ),
  //   );
  //   log('Seed: Successfully created team');
  // } catch (e) {
  //   log('Seed: Failed to create team');
  // }

  // try {
  //   await prisma.player.create(
  //     data: PrismaUnion.$1(
  //       PlayerCreateInput(
  //         lastName: 'Valmoria',
  //         firstName: 'Jiyo',
  //         middleName: 'Baababoi',
  //         gamesPlayed: PrismaUnion.$1(0),
  //         jerseyNumber: 1,
  //         team: TeamCreateNestedOneWithoutPlayerInput(
  //           connect: TeamWhereUniqueInput(id: (2)),
  //         ),
  //       ),
  //     ),
  //   );
  //   log('Seed: Successfully created player');
  // } catch (e) {
  //   log('Seed: Failed to create player');
  // }
// for quarter table create
//  -------------------------------------------- Create player statistics
  // try {
  //   // Define field values
  //   final madeOne = 5;
  //   final madeTwo = 3;
  //   final madeThree = 2;

  //   // Log the field values to ensure they are correct
  //   log('Made One: $madeOne');
  //   log('Made Two: $madeTwo');
  //   log('Made Three: $madeThree');

  //   //   // Calculate totalScore
  //   final totalScore = (madeOne * 1) + (madeTwo * 2) + (madeThree * 3);
  //   log('Total Score: $totalScore'); // Log the total score calculation

  //   //   // Create Quarter record
  //   final quarterID = 1; // Ensure this is a valid quarter ID
  //   log('Quarter ID: $quarterID');

  //   final playerID = 1; // Ensure this is a valid player ID
  //   log('Player ID: $playerID');

  //   final gameID = 1; // Ensure this is a valid player ID
  //   log('Game ID: $gameID');

  //   // Create quarter
  //   final playerStatisticsInput = PlayerStatisticsCreateInput(
  //     quarter: QuarterCreateNestedOneWithoutPlayerStatisticsInput(
  //         connect: QuarterWhereUniqueInput(id: quarterID)),
  //     madeOne: madeOne,
  //     madeTwo: madeTwo,
  //     madeThree: madeThree,
  //     totalScore: totalScore, // Computed value
  //     rebound: 1,
  //     foul: 2,
  //     assist: 1,
  //     turnover: 1,
  //     steal: 1,
  //     block: 1,
  //     // game: GameCreateNestedOneWithoutPlayerStatisticsInput(
  //     //     connect: GameWhereUniqueInput(id: gameID)),
  //     player: PlayerCreateNestedOneWithoutPlayerStatisticsInput(
  //         connect: PlayerWhereUniqueInput(id: playerID)),
  //   );

  //   log('Player Statistics Input: $playerStatisticsInput');

  //   await prisma.playerStatistics.create(
  //     data: PrismaUnion.$1(playerStatisticsInput),
  //   );

  //   log('Seed: Successfully created player statistics');
  // } catch (e) {
  //   log('Seed: Failed to create player statistics with error: $e');
  // }
//  -------------------------------------------- Create quarter
  // Future<void> createFinalQuarter() async {
  //     final logsID = [1, 2, 3];
  //   try {
  //     await prisma.finalQuarter.create(
  //       data: PrismaUnion.$1(
  //         FinalQuarterCreateInput(
  //           number: 1,
  //           game: GameCreateNestedOneWithoutFinalQuarterInput(
  //             connect: GameWhereUniqueInput(id: 1),
  //           ),
  //           logs: LogsCreateNestedManyWithoutFinalQuarterInput(
  //             connect: PrismaUnion.$2(
  //               logsID.map((id) => LogsWhereUniqueInput(id: 1)).toList(),
  //             ),
  //           ),
  //         ),
  //       ),
  //     );
  //     log('Successfully created final quarter');
  //   } catch (e) {
  //     log('Failed to create final quarter: $e');
  //   }
  // }

  // Future<void> createGame() async {
  //   try {
  //     await prisma.game.create(
  //       data: PrismaUnion.$1(
  //         GameCreateInput(
  //             date: DateTime.now(),
  //             semester: "1",
  //             team: const TeamCreateNestedOneWithoutGameInput(
  //               connect: (TeamWhereUniqueInput(id: 1)),
  //             ),
  //             title: 'JIYO VS THE WORLD',
  //             againstTeam: 'against Team',
  //             season: const SeasonCreateNestedOneWithoutGamesInput(
  //                 connect: SeasonWhereUniqueInput(id: 1))),
  //       ),
  //     );
  //     log('Seed: Successfully created game');
  //   } catch (e) {
  //     log('Seed: Failed to create game');
  //   }
  // }

  // Future<void> createLogs() async {
  //   try {
  //     await prisma.logs.create(
  //       data: PrismaUnion.$1(
  //         LogsCreateInput(
  //           isValidCombination: true,
  //           keywordOne: 'Player One',
  //           keywordTwo: 'Made',
  //           keywordThree: null,
  //           timestamp: DateTime.now(),
  //           finalQuarter: const FinalQuarterCreateNestedOneWithoutLogsInput(
  //               connect: FinalQuarterWhereUniqueInput(id: 1)),
  //         ),
  //       ),
  //     );
  //     log('Seed: Successfully created logs');
  //   } catch (e) {
  //     log('Seed: Failed to create logs');
  //   }
  // }
  // }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializePrisma();
  // seedData();
  loadPackageInfo();
  runApp(MyApp());
  createGame();
  // createLogs();
  createFinalQuarter();
  // deleteTeams();
  // deleteQuarter();
  // deleteLogs();
}

Future<void> initializePrisma() async {
  await initPrismaClient();
}

Future<void> createGame() async {
  try {
    // First, create the 4 quarters
    final List<int> quartersID = [];

    for (int i = 1; i <= 4; i++) {
      final finalQuarter = await prisma.finalQuarter.create(
        data: PrismaUnion.$1(
          FinalQuarterCreateInput(
            number: i,
            game: GameCreateNestedOneWithoutFinalQuarterInput(
              connect: GameWhereUniqueInput(id: 1),
            ),
          ),
        ),
      );
      quartersID
          .add(finalQuarter.id ?? 0); // Collect the IDs of the created quarters
    }

    // Now create the game and connect the 4 quarters to it
    await prisma.game.create(
      data: PrismaUnion.$1(
        GameCreateInput(
          date: DateTime.now(),
          semester: "1",
          team: const TeamCreateNestedOneWithoutGameInput(
            connect: (TeamWhereUniqueInput(id: 10)),
          ),
          title: 'JIYO VS THE WORLD',
          againstTeam: 'against Team',
          finalQuarter: FinalQuarterCreateNestedManyWithoutGameInput(
            connect: PrismaUnion.$2(
              quartersID
                  .map((id) => FinalQuarterWhereUniqueInput(id: id))
                  .toList(),
            ),
          ),
          season: const SeasonCreateNestedOneWithoutGamesInput(
            connect: SeasonWhereUniqueInput(id: 1),
          ),
        ),
      ),
    );
    log('Seed: Successfully created game with 4 quarters');
  } catch (e) {
    log('Seed: Failed to create game with quarters: $e');
  }
}

// Future<void> createLogs() async {
//   try {
//     await prisma.logs.create(
//       data: PrismaUnion.$1(
//         LogsCreateInput(
//           isValidCombination: true,
//           keywordOne: 'Player One',
//           keywordTwo: 'Made',
//           keywordThree: null,
//           timestamp: DateTime.now(),
//           finalQuarter: const FinalQuarterCreateNestedOneWithoutLogsInput(
//               connect: FinalQuarterWhereUniqueInput(id: 1)),
//         ),
//       ),
//     );
//     log('Seed: Successfully created logs');
//   } catch (e) {
//     log('Seed: Failed to create logs $e');
//   }
// }

Future<void> createFinalQuarter() async {
  final logsID = [1, 2, 3];
  try {
    await prisma.finalQuarter.create(
      data: PrismaUnion.$1(
        FinalQuarterCreateInput(
          number: 1,
          game: GameCreateNestedOneWithoutFinalQuarterInput(
            connect: GameWhereUniqueInput(id: 1),
          ),
          // logs: LogsCreateNestedManyWithoutFinalQuarterInput(
          //   connect: PrismaUnion.$2(
          //     logsID.map((id) => LogsWhereUniqueInput(id: 1)).toList(),
          //   ),
          // ),
        ),
      ),
    );
    log('Successfully created final quarter');
  } catch (e) {
    log('Failed to create final quarter: $e');
  }
}
// Future<void> deleteTeams() async {
//   try {
//     await prisma.team.deleteMany();
//     log('Successfully deleted all teams');
//   } catch (e) {
//     log('Failed to fetch teams: $e');
//   }
// }

// Future<void> deleteLogs() async {
//   try {
//     await prisma.logs.deleteMany();
//     log('Successfully deleted all logs');
//   } catch (e) {
//     log('Failed to fetch logs: $e');
//   }
// }

// Future<void> deleteQuarter() async {
//   try {
//     await prisma.quarter.deleteMany();
//     log('Successfully deleted all quarter');
//   } catch (e) {
//     log('Failed to fetch quarter: $e');
//   }
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basketball Voice Recognition App',
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      initialRoute: '/screens/teamStatistics', // mariel's initial route
      // initialRoute: '/screens/startRecording', jiyo's initial route
      // initialRoute: '/screens/landing', // mariel's initial route

      routes: {
        '/screens/landing': (context) => Landing(),
        '/screens/startRecording': (context) => StartRecording(),
        '/screens/dashboard': (context) => const Dashboard(),
        '/screens/teamStatistics': (context) => TeamStatistics(),
        '/screens/teamProfile': (context) => TeamProfile(),
        //'/screens/playerProfile': (context) => PlayerProfile(),
      },
    );
  }
}
