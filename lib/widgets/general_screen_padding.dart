import 'package:flutter/material.dart';

class GeneralScreenPadding extends StatelessWidget {
  final Widget child;

  const GeneralScreenPadding({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: child,
    );
  }
}
