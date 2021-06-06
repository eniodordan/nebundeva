import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final String buttonText;
  final Color textColour;
  final Color buttonColour;
  final VoidCallback onPressed;

  ActionButton({
    required this.buttonText,
    required this.textColour,
    required this.buttonColour,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Container(
        height: 60,
        width: double.infinity,
        child: ElevatedButton(
          child: Text(
            buttonText,
            style: TextStyle(
              color: textColour,
              fontSize: 24,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: buttonColour,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
