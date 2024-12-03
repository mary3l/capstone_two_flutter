import 'package:audio_classification/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:audio_classification/constants/stat_category.dart'; // Ensure StatCategory is correctly imported

class StatisticCategorySelector extends StatelessWidget {
  final Function(StatCategory) onSelectCategory;

  // Constructor to accept the callback
  const StatisticCategorySelector({Key? key, required this.onSelectCategory})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis
          .horizontal, // Make the buttons scrollable if there's not enough space
      child: Row(
        children: StatCategory.values.map((StatCategory category) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: () => onSelectCategory(
                  category), // When a category is selected, call the callback
              child: Text(
                _getCategoryLabel(
                    category), // Display the appropriate category name
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.darkOrange,
                padding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 16), // Adjust button size for mobile
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      8), // Rounded corners for the button
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // A method to return the correct string label for each stat category
  String _getCategoryLabel(StatCategory category) {
    switch (category) {
      case StatCategory.totalpoints:
        return "Points";
      case StatCategory.rebounds:
        return "Rebounds";
      case StatCategory.steal:
        return "Steals";
      case StatCategory.block:
        return "Blocks";
      case StatCategory.turnover:
        return "Turnovers";
      case StatCategory.foul:
        return "Fouls";
      case StatCategory.assists:
        return "Assists";
      default:
        return "";
    }
  }
}
