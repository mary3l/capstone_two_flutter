import 'package:flutter/material.dart';
import 'package:capstone_two_one/constants/colors.dart';

class StatCategorySelector extends StatefulWidget {
  final void Function(String)
      onSelectCategory; // Callback for selected category

  const StatCategorySelector({Key? key, required this.onSelectCategory})
      : super(key: key);

  @override
  _StatCategorySelectorState createState() => _StatCategorySelectorState();
}

class _StatCategorySelectorState extends State<StatCategorySelector> {
  String? focusedButton; // State to track the focused button

  final List<String> buttons = [
    "points",
    "rebound",
    "steal",
    "block",
    "turnover",
    "foul",
    "assist",
  ];

  void handlePress(String button) {
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
                button,
                style: TextStyle(
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
