import 'package:flutter/material.dart';

class VoteButton extends StatelessWidget {
  final IconData buttonIcon;
  final Color buttonColour;
  final VoidCallback onPressed;

  VoteButton({
    required this.buttonIcon,
    required this.buttonColour,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
        width: 80,
        height: 60,
      ),
      child: ElevatedButton(
        child: Icon(buttonIcon, size: 32),
        style: ElevatedButton.styleFrom(
          primary: buttonColour,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
