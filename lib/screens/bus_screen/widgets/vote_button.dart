import 'package:flutter/material.dart';
import 'package:nebundeva/constants.dart';

class VoteButton extends StatelessWidget {
  final bool isLower;
  final VoidCallback onPressed;

  VoteButton({required this.isLower, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 120,
      child: ElevatedButton(
        child: Icon(isLower ? Icons.arrow_downward : Icons.arrow_upward),
        style: ElevatedButton.styleFrom(
          primary: isLower ? kRedColour : kGreenColour,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
