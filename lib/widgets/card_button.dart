import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class CardButton extends StatefulWidget {
  final GlobalKey<FlipCardState> cardKey;
  final Image frontImage;
  final Image backImage;
  final bool isBusCard;
  final VoidCallback onPressed;

  CardButton({
    required this.cardKey,
    required this.frontImage,
    required this.backImage,
    required this.isBusCard,
    required this.onPressed,
  });

  @override
  _CardButtonState createState() => _CardButtonState();
}

class _CardButtonState extends State<CardButton> {
  bool _flipOnTouch = true;
  bool _isFront = true;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlipCard(
        key: widget.cardKey,
        flipOnTouch: widget.isBusCard ? false : _flipOnTouch,
        onFlip: () {
          setState(() => _flipOnTouch = false);
        },
        onFlipDone: (isFront) {
          widget.onPressed();

          setState(() {
            _isFront = isFront;
            _flipOnTouch = true;
          });
        },
        front: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Container(
            height: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: _isFront ? widget.frontImage : widget.backImage,
            ),
          ),
        ),
        back: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Container(
            height: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: !_isFront ? widget.frontImage : widget.backImage,
            ),
          ),
        ),
      ),
    );
  }
}
