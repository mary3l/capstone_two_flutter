import 'package:flutter/material.dart';
import '../constants/fonts.dart'; // Ensure this file exists and contains your font constants
import '../constants/colors.dart'; // Ensure this file exists and contains your color constants

class filterButton extends StatelessWidget {
  final String title;

  const filterButton({required this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Add button tap functionality here if needed
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 16,
        ), // Padding around the text and icon
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.black, width: 2),
          color: AppColors.lightOrange, // Background color
          borderRadius:
              BorderRadius.circular(5), // Rounded corners for the button
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min, // Wraps the width of the content
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontFamily: AppFonts.inter, // Use your font from constants
                color: Colors.white, // Set text color
              ),
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: Colors.white, // Set icon color
            ),
          ],
        ),
      ),
    );
  }
}
