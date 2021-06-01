import 'package:flutter/material.dart';
import 'package:nebundeva/constants.dart';

import 'package:nebundeva/screens/mode_screen.dart';
import 'package:nebundeva/widgets/player_text_field.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '(NE) ',
                    style: TextStyle(
                      color: kRedColour,
                      fontSize: 48,
                    ),
                  ),
                  Text(
                    'BUNDEVA',
                    style: TextStyle(
                      color: kGreenColour,
                      fontSize: 48,
                    ),
                  ),
                ],
              ),
              Text(
                'Tko igra?',
                style: TextStyle(fontSize: 46),
              ),
              Column(
                children: [
                  PlayerTextField(),
                  PlayerTextField(),
                  PlayerTextField(),
                  PlayerTextField(),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 75),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      'Dodaj igrača+',
                      style: TextStyle(
                        color: kBackgroundColour,
                        fontSize: 16,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF9A9AA1),
                      shape: new RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, ModeScreen.id);
                    },
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text(
                      'Započni',
                      style: TextStyle(
                        color: kBackgroundColour,
                        fontSize: 24,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, ModeScreen.id);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
