import 'package:flutter/material.dart';
import 'package:audio_classification/constants/colors.dart';

class RecordingField extends StatelessWidget {
  final String? speech;
  final String gameQuarter;
  final String type; // Use "inputSpeechFieldType" or "outputSpeechFieldType"
  final bool? isValidCombination;

  const RecordingField({
    Key? key,
    required this.speech,
    required this.type,
    required this.gameQuarter,
    this.isValidCombination,
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
            color: isValidCombination == null
                ? Colors.black // Default black when null
                : (isValidCombination!
                    ? Colors.green // Green if valid
                    : Colors.red), // Red if invalid
            width: 3,
          ),
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            Text(
              speech!,
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
            const SizedBox(height: 10),
            // Show the keyword combination when type is 'outputSpeechFieldType'
            if (type == 'outputSpeechFieldType') ...[
              Text(
                'Keyword Combination: $speech',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.normal,
                  color: Colors.black, // You can change the color as needed
                  fontSize: 14,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
