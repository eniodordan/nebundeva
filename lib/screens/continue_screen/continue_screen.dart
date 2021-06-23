import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nebundeva/constants.dart';

import 'package:nebundeva/models/bus_model.dart';
import 'package:nebundeva/models/nebundeva_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:nebundeva/widgets/action_button.dart';
import 'package:nebundeva/screens/bus_screen/bus_screen.dart';
import 'package:nebundeva/screens/game_screen/game_screen.dart';
import 'package:nebundeva/screens/home_screen/home_screen.dart';

class ContinueScreen extends StatelessWidget {
  static const String id = 'continue_screen';

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 25),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'images/logo.png',
                    width: 100.0,
                  ),
                  SizedBox(height: 75),
                  ActionButton(
                    buttonText: 'Nastavi igru',
                    textColour: kBackgroundColour,
                    buttonColour: Color(0xFF9A9AA1),
                    onPressed: () async {
                      final prefs = await SharedPreferences.getInstance();
                      int gameProgress = prefs.getInt('gameProgress')!;

                      if (gameProgress == 1) {
                        await Provider.of<NebundevaModel>(context,
                                listen: false)
                            .loadPrefs();
                        Navigator.popAndPushNamed(context, HomeScreen.id);
                        Navigator.pushNamed(context, GameScreen.id);
                      } else {
                        await Provider.of<BusModel>(context, listen: false)
                            .loadPrefs();
                        Navigator.popAndPushNamed(context, HomeScreen.id);
                        Navigator.pushNamed(context, BusScreen.id);
                      }
                    },
                  ),
                  ActionButton(
                    buttonText: 'Započni novu igru',
                    textColour: kBackgroundColour,
                    buttonColour: Colors.white,
                    onPressed: () {
                      Navigator.popAndPushNamed(context, HomeScreen.id);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
