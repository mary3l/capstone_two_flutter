import 'package:flutter/material.dart';

// import 'package:audio_classification/screens/playerProfile.dart';
import 'package:audio_classification/screens/teamProfile.dart';
// import 'package:audio_classification/screens/teamStatistics.dart';
import 'package:audio_classification/screens/startRecording.dart';
import 'package:audio_classification/screens/dashboard.dart';
import 'package:audio_classification/screens/landing.dart';
// import 'package:audio_classification/screens/teamPlayerProfile.dart';
import 'package:package_info_plus/package_info_plus.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure Flutter bindings are initialized

  // Fetch package info
  final packageInfo = await PackageInfo.fromPlatform();

  // Print app information to the terminal
  print("App Name: ${packageInfo.appName}");
  print("Package Name: ${packageInfo.packageName}");
  print("Version: ${packageInfo.version}");
  print("Build Number: ${packageInfo.buildNumber}");

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
        '/screens/dashboard': (context) => const Dashboard(),
        // '/screens/teamStatistics': (context) => TeamStatistics(),
        '/screens/teamProfile': (context) => TeamProfile(),
        // '/screens/playerProfile': (context) => PlayerProfile(),
        // '/screens/teamPlayerProfile': (context) => TeamPlayerProfile()
      },
    );
  }
}
