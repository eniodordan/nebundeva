import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class CardButton extends StatelessWidget {
  final Image cardImage;
  final VoidCallback onPressed;

  CardButton({required this.cardImage, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlipCard(
        onFlip: () {
          Future.delayed(const Duration(milliseconds: 250), () {
            onPressed();
          });
        },
        front: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Container(
            height: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: cardImage,
            ),
          ),
        ),
        back: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Container(
            height: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: cardImage,
            ),
          ),
        ),
      ),
    );
  }
}
