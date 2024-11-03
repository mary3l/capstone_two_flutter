import 'package:flutter/material.dart';
import 'package:audio_classification/constants/colors.dart';

enum LabelAlignment {
  header,
  sectionLabel,
}

class Label extends StatelessWidget {
  final String text;
  final LabelAlignment alignment;

  const Label({Key? key, required this.text, required this.alignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment == LabelAlignment.header
          ? Alignment.center
          : Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 15,
          color: AppColors.grey,
        ),
      ),
    );
  }
}
