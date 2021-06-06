import 'package:flutter/material.dart';
import 'package:nebundeva/constants.dart';

import 'widgets/vote_button.dart';
import 'package:nebundeva/widgets/card_button.dart';

class BusScreen extends StatefulWidget {
  static const String id = 'bus_screen';

  @override
  _BusScreenState createState() => _BusScreenState();
}

class _BusScreenState extends State<BusScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      'BUS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 42,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Razina: ',
                          style: TextStyle(
                            color: kGreyColour,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          '2',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          ' od 5',
                          style: TextStyle(
                            color: kLightGreyColour,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                CardButton(
                  cardImage: Image.asset('images/queen_of_bells.jpg'),
                  onPressed: () {},
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Enio',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                          ),
                        ),
                        Text(
                          ' bira',
                          style: TextStyle(
                            color: kLightGreyColour,
                            fontSize: 28,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 25),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          VoteButton(
                            isLower: true,
                            onPressed: () {},
                          ),
                          SizedBox(width: 25),
                          VoteButton(
                            isLower: false,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
