import 'package:flutter/material.dart';
import 'package:nebundeva/constants.dart';

import 'package:provider/provider.dart';

import 'package:nebundeva/models/game_data.dart';
import 'package:nebundeva/screens/home_screen.dart';
import 'package:nebundeva/screens/mode_screen.dart';

void main() {
  runApp(Nebundeva());
}

class Nebundeva extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GameData(),
      child: MaterialApp(
        title: '(Ne)bundeva',
        theme: ThemeData(
          brightness: Brightness.dark,
          backgroundColor: kBackgroundColour,
          scaffoldBackgroundColor: kBackgroundColour,
          fontFamily: 'BebasNeue',
        ),
        initialRoute: HomeScreen.id,
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
          ModeScreen.id: (context) => ModeScreen(),
        },
      ),
    );
  }
}
