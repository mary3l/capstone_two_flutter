import 'package:flutter/material.dart';
import 'package:capstone_two_one/constants/colors.dart';

class Header extends StatelessWidget {
  final String title;
  final String alignment; // Use "headerAlignment" or "sectionTitleAlignment"
  final String textType; // Use "headerText" or "sectionTextType"

  const Header({
    Key? key,
    required this.title,
    required this.alignment,
    required this.textType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment == "headerAlignment"
          ? Alignment.center
          : Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 60),
      child: Text(
        title,
        style: textType == "headerText"
            ? TextStyle(
                fontFamily: 'Jersey10',
                fontSize: 40,
                color: AppColors.black,
              )
            : TextStyle(
                fontFamily: 'Jersey10',
                fontSize: 32,
                color: AppColors.grey,
              ),
        textAlign: textType == "headerText"
            ? TextAlign.center
            : TextAlign.left, // Set textAlign here
      ),
    );
  }
}
