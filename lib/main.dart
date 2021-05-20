import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:nebundeva/models/game_data.dart';
import 'package:nebundeva/screens/home_screen.dart';

void main() {
  runApp(Nebundeva());
}

class Nebundeva extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GameData(),
      child: MaterialApp(
        initialRoute: HomeScreen.id,
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
        },
      ),
    );
  }
}
