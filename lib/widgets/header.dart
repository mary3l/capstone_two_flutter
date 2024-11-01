import 'package:flutter/material.dart';
import 'package:capstone_two_one/constants/colors.dart';

enum HeaderAlignment {
  header,
  sectionTitle,
}

enum TextType {
  header,
  section,
}

class Header extends StatelessWidget {
  final String title;
  final HeaderAlignment alignment; // Use enum for alignment
  final TextType textType; // Use enum for text type

  const Header({
    Key? key,
    required this.title,
    required this.alignment,
    required this.textType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment == HeaderAlignment.header
          ? Alignment.center
          : Alignment.centerLeft,
      child: Text(
        title,
        style: textType == TextType.header
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
        textAlign:
            textType == TextType.header ? TextAlign.center : TextAlign.left,
      ),
    );
  }
}
