import 'package:capstone_two_one/constants/colors.dart';
import 'package:capstone_two_one/constants/stat_category.dart'; // Import your constants file
import 'package:flutter/material.dart';

class StatCategorySelector extends StatefulWidget {
  final void Function(StatCategory)
      onSelectCategory; // Updated to use StatCategory

  const StatCategorySelector({Key? key, required this.onSelectCategory})
      : super(key: key);

  @override
  _StatCategorySelectorState createState() => _StatCategorySelectorState();
}

class _StatCategorySelectorState extends State<StatCategorySelector> {
  StatCategory? focusedButton; // State to track the focused button

  final List<StatCategory> buttons = [
    StatCategory.points,
    StatCategory.rebounds,
    StatCategory.steal,
    StatCategory.block,
    StatCategory.turnover,
    StatCategory.foul,
    StatCategory.assists,
  ];

  void handlePress(StatCategory button) {
    setState(() {
      focusedButton = button; // Set the focused button
    });
    widget.onSelectCategory(button); // Call the provided callback
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: buttons.map((button) {
          bool isFocused =
              focusedButton == button; // Check if the button is focused
          return GestureDetector(
            onTap: () => handlePress(button),
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: isFocused ? AppColors.lightOrange : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isFocused ? Colors.black : Colors.transparent,
                  width: 2,
                ),
              ),
              child: Text(
                button
                    .toString()
                    .split('.')
                    .last, // Display the name of the StatCategory
                style: TextStyle(
                  fontSize: 14,
                  color: isFocused ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
