import 'package:flutter/material.dart';
import '../constants/fonts.dart';
import '../constants/colors.dart';

class Button extends StatelessWidget {
  final String text;
  final Widget? icon;
  final VoidCallback onPress;

  const Button({
    Key? key,
    required this.onPress,
    required this.text,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.lightOrange,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.black, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: icon,
              ),
            Text(
              text,
              style: AppFonts.interStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white),
            ),
          ],
        ),
      ),
    );
  }
}
