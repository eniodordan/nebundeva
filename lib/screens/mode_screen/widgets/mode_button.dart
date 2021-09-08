import 'package:flutter/material.dart';

class ModeButton extends StatelessWidget {
  final String tileLabel;
  final Color tileColour;
  final VoidCallback onPressed;

  ModeButton(
      {required this.tileLabel,
      required this.tileColour,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Container(
          width: double.infinity,
          child: ElevatedButton(
            child: SizedBox.expand(
              child: Padding(
                padding: EdgeInsets.only(left: 25, top: 25),
                child: Text(
                  tileLabel,
                  style: TextStyle(fontSize: 36),
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
              primary: tileColour,
              padding: EdgeInsets.all(0),
              shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
