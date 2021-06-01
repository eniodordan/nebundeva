import 'package:flutter/material.dart';

class ModeTile extends StatelessWidget {
  final String tileLabel;
  final Color tileColour;
  final VoidCallback onPressed;

  ModeTile(
      {required this.tileLabel,
      required this.tileColour,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          width: double.infinity,
          child: ElevatedButton(
            child: Text(tileLabel),
            style: ElevatedButton.styleFrom(
              primary: tileColour,
            ),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
