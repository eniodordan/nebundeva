import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nebundeva/constants.dart';

import 'package:nebundeva/models/nebundeva_model.dart';

import 'widgets/mode_button.dart';
import 'package:nebundeva/screens/game_screen/game_screen.dart';

class ModeScreen extends StatelessWidget {
  static const String id = 'mode_screen';

  @override
  Widget build(BuildContext context) {
    final List<String> players =
        ModalRoute.of(context)!.settings.arguments as List<String>;

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
                      onPressed: () async {
                        await Provider.of<NebundevaModel>(context,
                                listen: false)
                            .initializeModel(true, players);

                        Navigator.popAndPushNamed(context, GameScreen.id,
                            arguments: true);
                      },
                    ),
                    ModeButton(
                      tileLabel: '(NE) BUNDEVA',
                      tileColour: kRedColour,
                      onPressed: () async {
                        await Provider.of<NebundevaModel>(context,
                                listen: false)
                            .initializeModel(false, players);

                        Navigator.popAndPushNamed(context, GameScreen.id,
                            arguments: true);
                      },
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
