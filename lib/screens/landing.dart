import 'package:capstone_two_one/widgets/customDrawer.dart';
import 'package:flutter/material.dart';
import 'package:capstone_two_one/widgets/general_screen_padding.dart';
import 'package:capstone_two_one/widgets/header.dart';
import 'package:capstone_two_one/widgets/button.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: GeneralScreenPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Header
            const Header(
              title: 'BASKETBALL VOICE RECOGNITION APP',
              alignment: HeaderAlignment.header,
              textType: TextType.header,
            ),
            const SizedBox(height: 30),

            Button(
              icon: Icon(Icons.mic, color: Colors.white),
              text: 'Start Recording',
              onPress: () {
                Navigator.pushNamed(context, '/screens/startRecording');
              },
            ),
            const SizedBox(height: 20),
            // Dashboard Button
            Button(
              text: 'Dashboard',
              onPress: () {
                Navigator.pushNamed(context, '/screens/dashboard');
              },
            ),
          ],
        ),
      ),
    );
  }
}
