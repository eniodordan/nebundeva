import 'package:flutter/material.dart';
import 'package:nebundeva/constants.dart';

import 'package:nebundeva/screens/game_screen.dart';

class ModeScreen extends StatelessWidget {
  static const String id = 'mode_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 25),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.arrow_back,
                      size: 32,
                      color: kGreyColour,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Odaberi način',
                    style: TextStyle(
                      fontSize: 24,
                      color: kGreyColour,
                    ),
                  ),
                  Container(width: 32),
                ],
              ),
              SizedBox(height: 50),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ModeButton(
                      tileLabel: 'BUNDEVA',
                      tileColour: kGreenColour,
                      onPressed: () {
                        Navigator.popAndPushNamed(context, GameScreen.id);
                      },
                    ),
                    ModeButton(
                      tileLabel: '(NE) BUNDEVA',
                      tileColour: kRedColour,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
