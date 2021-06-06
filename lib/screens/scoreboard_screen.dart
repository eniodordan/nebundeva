import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nebundeva/constants.dart';

import 'package:nebundeva/models/player.dart';
import 'package:nebundeva/models/nebundeva_model.dart';

class ScoreboardScreen extends StatefulWidget {
  static const String id = 'scoreboard_screen';

  @override
  _ScoreboardScreenState createState() => _ScoreboardScreenState();
}

class _ScoreboardScreenState extends State<ScoreboardScreen> {
  @override
  Widget build(BuildContext context) {
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
                          itemCount: Provider.of<NebundevaModel>(context)
                              .players
                              .length,
                          itemBuilder: (BuildContext context, int index) {
                            return ScoreboardTile(
                                isFirst: index == 0 ? true : false,
                                player: Provider.of<NebundevaModel>(context)
                                    .players[index]);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                BusButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ScoreboardTile extends StatelessWidget {
  final bool isFirst;
  final Player player;

  ScoreboardTile({required this.isFirst, required this.player});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        decoration: BoxDecoration(
          color: isFirst ? kDarkRedColour : kDarkGreyColour,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              player.playerName,
              style: TextStyle(
                fontSize: 24,
                color: isFirst ? kRedColour : Colors.white,
              ),
            ),
            Text(
              '${player.bellsNumber}',
              style: TextStyle(
                fontSize: 24,
                color: isFirst ? kRedColour : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BusButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        height: 60,
        width: double.infinity,
        child: ElevatedButton(
          child: Text(
            'Bus',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          style: ElevatedButton.styleFrom(
            primary: kRedColour,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
