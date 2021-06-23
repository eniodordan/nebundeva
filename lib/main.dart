import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:nebundeva/constants.dart';

import 'package:nebundeva/models/nebundeva_model.dart';
import 'package:nebundeva/models/bus_model.dart';

import 'package:nebundeva/screens/continue_screen/continue_screen.dart';
import 'package:nebundeva/screens/home_screen/home_screen.dart';
import 'package:nebundeva/screens/mode_screen/mode_screen.dart';
import 'package:nebundeva/screens/game_screen/game_screen.dart';
import 'package:nebundeva/screens/scoreboard_screen/scoreboard_screen.dart';
import 'package:nebundeva/screens/bus_screen/bus_screen.dart';

void main() => runApp(Nebundeva());

class Nebundeva extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NebundevaModel()),
        ChangeNotifierProvider(create: (context) => BusModel()),
      ],
      child: MaterialApp(
        title: '(Ne)bundeva',
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.white,
          accentColor: Colors.white,
          backgroundColor: kBackgroundColour,
          dialogBackgroundColor: kBackgroundColour,
          scaffoldBackgroundColor: kBackgroundColour,
          fontFamily: 'BebasNeue',
        ),
        initialRoute: ContinueScreen.id,
        routes: {
          ContinueScreen.id: (context) => ContinueScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          ModeScreen.id: (context) => ModeScreen(),
          GameScreen.id: (context) => GameScreen(),
          ScoreboardScreen.id: (context) => ScoreboardScreen(),
          BusScreen.id: (context) => BusScreen(),
        },
      ),
    );
  }
}
