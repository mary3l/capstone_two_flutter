import 'dart:developer';

import 'package:audio_classification/helper/prisma.dart';
import 'package:audio_classification/prisma/generated_dart_client/prisma.dart';
import 'package:flutter/material.dart';

// import 'package:audio_classification/screens/playerProfile.dart';
import 'package:audio_classification/screens/teamProfile.dart';
// import 'package:audio_classification/screens/teamStatistics.dart';
import 'package:audio_classification/screens/startRecording.dart';
import 'package:audio_classification/screens/dashboard.dart';
import 'package:audio_classification/screens/landing.dart';
import 'package:orm/orm.dart';
// import 'package:audio_classification/screens/teamPlayerProfile.dart';
import 'package:package_info_plus/package_info_plus.dart';

void loadPackageInfo() async {
  final packageInfo = await PackageInfo.fromPlatform();

  // Print app information to the terminal
  print("App Name: ${packageInfo.appName}");
  print("Package Name: ${packageInfo.packageName}");
  print("Version: ${packageInfo.version}");
  print("Build Number: ${packageInfo.buildNumber}");
}

void seedData() async {
  try {
    await prisma.season.create(
      data: const PrismaUnion.$1(
        SeasonCreateInput(
          startYear: 2021,
          endYear: 2022,
        ),
      ),
    );
    log('Seed: Successfully created season');
  } catch (e) {
    log('Seed: Failed to create season');
  }

  try {
    await prisma.team.create(
      data: const PrismaUnion.$1(
        TeamCreateInput(
          name: 'TeamA',
        ),
      ),
    );
    log('Seed: Successfully created team');
  } catch (e) {
    log('Seed: Failed to create team');
  }

  try {
    await prisma.player.create(
      data: PrismaUnion.$1(
        PlayerCreateInput(
          lastName: 'Valmoria',
          firstName: 'Jiyo',
          middleName: 'Baababoi',
          gamesPlayed: PrismaUnion.$1(0),
          jerseyNumber: 1,
          team: TeamCreateNestedOneWithoutPlayerInput(
            connect: TeamWhereUniqueInput(
                id: (1)), // Wrap the integer in PrismaUnion
          ),
        ),
      ),
    );
    log('Seed: Successfully created player');
  } catch (e) {
    log('Seed: Failed to create player');
  }

  try {
    await prisma.quarter.create(
      data: const PrismaUnion.$1(
        QuarterCreateInput(
          number: 1,
          totalScore: 0,
          madeOne: 0,
          madeTwo: 0,
          madeThree: 0,
          miss: 0,
          reboundOffensive: 0,
          assist: 0,
          block: 0,
          foul: 0,
          reboundDefensive: 0,
          steal: 0,
          turnover: 0,
        ),
      ),
    );
    log('Seed: Successfully created quarter');
  } catch (e) {
    log('Seed: Failed to create quarter');
  }

  try {
    await prisma.game.create(
      data: PrismaUnion.$1(
        GameCreateInput(
            date: DateTime.now(),
            semester: "1",
            team: const TeamCreateNestedOneWithoutGameInput(
              connect: (TeamWhereUniqueInput(id: 1)),
            ),
            title: 'JIYO VS THE WORLD',
            againstTeam: 'against Team',
            season: const SeasonCreateNestedOneWithoutGamesInput(
                connect: SeasonWhereUniqueInput(id: 1))),
      ),
    );
    log('Seed: Successfully created game');
  } catch (e) {
    log('Seed: Failed to create game');
  }

  try {
    await prisma.logs.create(
      data: PrismaUnion.$1(
        LogsCreateInput(
          keywordOne: 'Player One',
          keywordTwo: 'Made',
          keywordThree: null,
          timestamp: DateTime.now(),
          quarter: const QuarterCreateNestedOneWithoutLogsInput(
            connect: (QuarterWhereUniqueInput(id: 1)),
          ),
        ),
      ),
    );
    log('Seed: Successfully created logs');
  } catch (e) {
    log('Seed: Failed to create logs');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializePrisma();
  //seedData();
  loadPackageInfo();
  runApp(MyApp());
}

Future<void> initializePrisma() async {
  await initPrismaClient();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basketball Voice Recognition App',
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      initialRoute: '/screens/startRecording',
      routes: {
        '/screens/landing': (context) => Landing(),
        '/screens/startRecording': (context) => StartRecording(),
        '/screens/dashboard': (context) => const Dashboard(),
        // '/screens/teamStatistics': (context) => TeamStatistics(),
        '/screens/teamProfile': (context) => TeamProfile(),
        // '/screens/playerProfile': (context) => PlayerProfile(),
        // '/screens/teamPlayerProfile': (context) => TeamPlayerProfile()
      },
    );
  }
}
