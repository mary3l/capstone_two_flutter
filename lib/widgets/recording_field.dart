import 'package:flutter/material.dart';
import 'package:capstone_two_one/constants/colors.dart';

class RecordingField extends StatelessWidget {
  final String speech;
  final String gameQuarter;
  final String type; // Use "inputSpeechFieldType" or "outputSpeechFieldType"

  const RecordingField({
    Key? key,
    required this.speech,
    required this.type,
    required this.gameQuarter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        padding: type == "inputSpeechFieldType"
            ? const EdgeInsets.all(20)
            : const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: type == "inputSpeechFieldType"
                ? AppColors.darkOrange
                : AppColors.black,
            width: 3,
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              speech,
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                color: AppColors.darkOrange,
                fontSize: 16,
              ),
            ),
            if (gameQuarter.isNotEmpty) // Check if gameQuarter is not empty
              Text(
                'Game Quarter: $gameQuarter',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight:
                      FontWeight.normal, // Use normal for regular weight
                  color: AppColors.grey,
                  fontSize: 12,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
