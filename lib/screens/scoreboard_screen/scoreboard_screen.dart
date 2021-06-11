import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nebundeva/constants.dart';

import 'package:nebundeva/models/bus_model.dart';
import 'package:nebundeva/models/nebundeva_model.dart';

import 'widgets/scoreboard_tile.dart';
import 'package:nebundeva/widgets/action_button.dart';
import 'package:nebundeva/screens/bus_screen/bus_screen.dart';

class ScoreboardScreen extends StatefulWidget {
  static const String id = 'scoreboard_screen';

  @override
  _ScoreboardScreenState createState() => _ScoreboardScreenState();
}

class _ScoreboardScreenState extends State<ScoreboardScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NebundevaModel>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '(NE) BUNDEVA',
                  style: TextStyle(
                    color: kRedColour,
                    fontSize: 42,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      'Poredak igrača',
                      style: TextStyle(
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(height: 25),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Ime igrača',
                              style: TextStyle(
                                fontSize: 24,
                                color: kLightGreyColour,
                              ),
                            ),
                            Text(
                              'Broj bundevi',
                              style: TextStyle(
                                fontSize: 24,
                                color: kLightGreyColour,
                              ),
                            ),
                          ],
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: viewModel.players.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ScoreboardTile(
                              isDriver: index == 0 ? true : false,
                              player: viewModel.players[index],
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                ActionButton(
                  buttonText: 'Bus',
                  textColour: Colors.white,
                  buttonColour: kRedColour,
                  onPressed: () {
                    Provider.of<BusModel>(context, listen: false)
                        .initializeModel(viewModel.players[0]);

                    Navigator.popAndPushNamed(context, BusScreen.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
