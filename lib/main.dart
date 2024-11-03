import 'package:flutter/material.dart';

import 'package:audio_classification/screens/playerProfile.dart';
import 'package:audio_classification/screens/teamProfile.dart';
import 'package:audio_classification/screens/teamStatistics.dart';
import 'package:audio_classification/screens/startRecording.dart';
import 'package:audio_classification/screens/dashboard.dart';
import 'package:audio_classification/screens/landing.dart';
import 'package:audio_classification/screens/teamPlayerProfile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basketball Voice Recognition App',
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      initialRoute: '/screens/landing',
      routes: {
        '/screens/landing': (context) => Landing(),
        '/screens/startRecording': (context) => StartRecording(),
        '/screens/dashboard': (context) => Dashboard(),
        '/screens/teamStatistics': (context) => TeamStatistics(),
        '/screens/teamProfile': (context) => TeamProfile(),
        '/screens/playerProfile': (context) => PlayerProfile(),
        '/screens/teamPlayerProfile': (context) => TeamPlayerProfile()
      },
    );
  }
}
