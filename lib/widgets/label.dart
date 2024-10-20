import 'package:flutter/material.dart';
import 'package:capstone_two_one/constants/colors.dart';

class Label extends StatelessWidget {
  final String text;

  const Label({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
      alignment: Alignment.center,
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
