import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class CardButton extends StatefulWidget {
  final GlobalKey<FlipCardState>? cardKey;
  final Image cardImage;
  final VoidCallback onPressed;

  CardButton({this.cardKey, required this.cardImage, required this.onPressed});

  @override
  _CardButtonState createState() => _CardButtonState();
}

class _CardButtonState extends State<CardButton> {
  bool _flipOnTouch = true;
  bool _isFront = true;
  Image? currentImage;

  @override
  void initState() {
    super.initState();
    currentImage = widget.cardImage;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlipCard(
        key: widget.cardKey,
        flipOnTouch: widget.cardKey != null ? false : _flipOnTouch,
        onFlip: () {
          setState(() => _flipOnTouch = false);
          widget.onPressed();
        },
        onFlipDone: (isFront) {
          currentImage = widget.cardImage;
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
              child: _isFront ? currentImage : widget.cardImage,
            ),
          ),
        ),
        back: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Container(
            height: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: !_isFront ? currentImage : widget.cardImage,
            ),
          ),
        ),
      ),
    );
  }
}
