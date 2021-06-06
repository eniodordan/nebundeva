import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  final Image cardImage;
  final VoidCallback onPressed;

  CardButton({required this.cardImage, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Container(
            height: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: cardImage,
            ),
          ),
        ),
        onTap: onPressed,
      ),
    );
  }
}
