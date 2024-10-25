import 'package:capstone_two_one/widgets/general_screen_padding.dart';
import 'package:capstone_two_one/widgets/header.dart';
import 'package:capstone_two_one/widgets/button.dart'; // Import your custom Button widget
import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GeneralScreenPadding(
      child: Container(
        color: Colors.white, // Set the background color to white
        child: Stack(
          children: [
            // Ball 1 (top left)
            Positioned(
              top: -70,
              left: -40,
              child: Image.asset(
                'lib/assets/images/ball.png',
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),

            // Header
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Header(
                    title: 'BASKETBALL VOICE RECOGNITION APP',
                    alignment: 'headerAlignment',
                    textType: 'headerText',
                  ),
                  const SizedBox(height: 30),

                  // Buttons section
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Button(
                        text: 'Start Recording',
                        icon: Icon(Icons.mic, color: Colors.white),
                        onPress: () {
                          Navigator.pushNamed(
                              context, '/screens/startRecording');
                        },
                      ),
                      const SizedBox(height: 10),
                      Button(
                        text: 'Dashboard',
                        onPress: () {
                          Navigator.pushNamed(context, '/screens/dashboard');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Ball 2 (middle right)
            Positioned(
              top: MediaQuery.of(context).size.height * 0.35 - 50,
              right: -10,
              child: Image.asset(
                'lib/assets/images/ball.png',
                width: 150,
                height: 150,
                fit: BoxFit.contain,
              ),
            ),

            // Ball 3 (middle left)
            Positioned(
              top: MediaQuery.of(context).size.height * 0.5 - 50,
              left: -110,
              child: Image.asset(
                'lib/assets/images/ball.png',
                width: 250,
                height: 250,
                fit: BoxFit.contain,
              ),
            ),

            // Ball 4 (bottom right)
            Positioned(
              bottom: -40,
              right: -45,
              child: Image.asset(
                'lib/assets/images/ball.png',
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
