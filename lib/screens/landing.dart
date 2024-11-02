import 'package:flutter/material.dart';
import 'package:audio_classification/widgets/general_screen_padding.dart';
import 'package:audio_classification/widgets/header.dart';
import 'package:audio_classification/widgets/button.dart';

class Landing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Stack(
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
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                  child: const Center(child: Text('Image not found')),
                );
              },
            ),
          ),

          // Ball 2 (middle right)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.20 - 50,
            right: -10,
            child: Image.asset(
              'lib/assets/images/ball.png',
              width: 150,
              height: 150,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 150,
                  height: 150,
                  color: Colors.red,
                  child: const Center(child: Text('Image not found')),
                );
              },
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
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 250,
                  height: 250,
                  color: Colors.red,
                  child: const Center(child: Text('Image not found')),
                );
              },
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
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 200,
                  height: 200,
                  color: Colors.red,
                  child: const Center(child: Text('Image not found')),
                );
              },
            ),
          ),

          // General Screen Padding with Header and Buttons
          GeneralScreenPadding(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Header(
                    title: 'BASKETBALL VOICE RECOGNITION APP',
                    alignment: HeaderAlignment.header,
                    textType: TextType.header,
                  ),
                  const SizedBox(height: 30),

                  // Buttons section
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Button(
                        icon: Icon(Icons.mic, color: Colors.white),
                        text: 'Start Recording',
                        onPress: () {
                          Navigator.pushNamed(
                              context, '/screens/startRecording');
                        },
                      ),
                      const SizedBox(height: 20),
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
          ),
        ],
      ),
    );
  }
}
