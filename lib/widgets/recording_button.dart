import 'package:flutter/material.dart';
import 'package:capstone_two_one/constants/colors.dart';

class RecordingButton extends StatelessWidget {
  final String? text;

  const RecordingButton({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (text != null)
          Text(
            text!,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              color: AppColors.grey,
              fontWeight:
                  FontWeight.normal, // Change to 'normal' for regular weight
            ),
          ),
        GestureDetector(
          onTap: () {
            // Handle microphone tap event
          },
          child: Container(
            height: 135.53,
            width: 280,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.black, width: 6),
              borderRadius: BorderRadius.circular(37.65),
              color: AppColors.lightOrange,
            ),
            child: Center(
              child: Icon(
                Icons.mic,
                size: 75,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
