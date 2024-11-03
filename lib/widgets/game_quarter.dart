import 'package:flutter/material.dart';
import 'package:audio_classification/constants/colors.dart';

class GameQuarter extends StatefulWidget {
  final Function(String) onSelectQuarter; // Callback to pass selected quarter

  const GameQuarter({Key? key, required this.onSelectQuarter})
      : super(key: key);

  @override
  _GameQuarterState createState() => _GameQuarterState();
}

class _GameQuarterState extends State<GameQuarter> {
  String? focusedButton; // State to track the focused button

  @override
  Widget build(BuildContext context) {
    final quarter = ["1", "2", "3", "4"];

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Game Quarter'.toUpperCase(),
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.grey,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: quarter.map((button) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    focusedButton = button; // Update focused button
                  });
                  widget.onSelectQuarter(
                      button); // Pass selected quarter to parent
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: focusedButton == button
                        ? AppColors.lightOrange
                        : Colors.transparent,
                    border: focusedButton == button
                        ? Border.all(color: Colors.black, width: 3)
                        : null,
                  ),
                  child: Text(
                    button,
                    style: TextStyle(
                      fontFamily: 'Jersey10Regular',
                      fontSize: 25,
                      color: focusedButton == button
                          ? Colors.white
                          : AppColors.grey,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
