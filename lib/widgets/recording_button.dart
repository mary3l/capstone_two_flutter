import 'package:flutter/material.dart';
import 'package:capstone_two_one/constants/colors.dart';

class RecordingButton extends StatefulWidget {
  final String? text;

  const RecordingButton({Key? key, this.text}) : super(key: key);

  @override
  _RecordingButtonState createState() => _RecordingButtonState();
}

class _RecordingButtonState extends State<RecordingButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(microseconds: 50000),
      vsync: this,
    );
    // Set up the animation
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // void _onLongPressStart(LongPressStartDetails details) {
  //   _controller.forward(); // Animate to a larger size immediately
  // }

  // void _onLongPressEnd(LongPressEndDetails details) {
  //   _controller.reverse(); // Return to original size immediately
  // }

  void _onTapDown(TapDownDetails details) {
    _controller.forward(); // Animate to a larger size immediately
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse(); // Return to original size immediately
  }

  void _onTapCancel() {
    _controller.reverse(); // Reverse if the tap is canceled
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onLongPressStart: _onLongPressStart,
      // onLongPressEnd: _onLongPressEnd,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: ScaleTransition(
        scale: _animation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.text != null)
              Text(
                widget.text!,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  color: AppColors.grey,
                  fontWeight: FontWeight
                      .normal, // Change to 'normal' for regular weight
                ),
              ),
            Container(
              height: 135.53,
              width: 280,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.black, width: 6),
                borderRadius: BorderRadius.circular(37.65),
                color: AppColors.lightOrange,
              ),
              child: Center(
                child: Icon(
                  Icons.mic,
                  size: 75,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
