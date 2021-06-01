import 'package:flutter/material.dart';
import 'package:nebundeva/constants.dart';
import 'package:nebundeva/widgets/mode_tile.dart';

class ModeScreen extends StatelessWidget {
  static const String id = 'mode_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 25, 25, 0),
                child: Text(
                  'Odaberi način:',
                  style: TextStyle(
                    fontSize: 21.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(25),
                  child: Column(
                    children: [
                      ModeTile(
                        tileLabel: 'BUNDEVA',
                        tileColour: kGreenColour,
                        onPressed: () {},
                      ),
                      ModeTile(
                        tileLabel: '(NE) BUNDEVA',
                        tileColour: kRedColour,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      '4 igrača',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    Container(width: 50),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
