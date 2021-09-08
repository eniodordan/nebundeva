import 'package:flutter/material.dart';
import 'package:nebundeva/constants.dart';

import 'package:nebundeva/models/player.dart';

class ScoreboardTile extends StatelessWidget {
  final bool isDriver;
  final Player player;

  ScoreboardTile({required this.isDriver, required this.player});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        decoration: BoxDecoration(
          color: isDriver ? kDarkRedColour : kDarkGreyColour,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              player.playerName,
              style: TextStyle(
                fontSize: 24,
                color: isDriver ? kRedColour : Colors.white,
              ),
            ),
            Text(
              '${player.bellsNumber}',
              style: TextStyle(
                fontSize: 24,
                color: isDriver ? kRedColour : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
