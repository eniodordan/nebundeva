import 'package:flutter/material.dart';
import 'package:nebundeva/constants.dart';
import 'package:provider/provider.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:nebundeva/models/bus_model.dart';

import 'widgets/vote_button.dart';
import 'package:flip_card/flip_card.dart';
import 'package:nebundeva/widgets/card_button.dart';

class BusScreen extends StatefulWidget {
  static const String id = 'bus_screen';

  @override
  _BusScreenState createState() => _BusScreenState();
}

class _BusScreenState extends State<BusScreen> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  AudioCache audioCache = AudioCache();
  AudioPlayer? audioPlayer;

  void _playSound(String localPath) async {
    await audioPlayer?.stop();
    audioPlayer = await audioCache.play(localPath);
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<BusModel>(context);

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
                          '${viewModel.driverSeat + 1}',
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
                  cardKey: cardKey,
                  frontImage:
                      viewModel.busPlayingCards[viewModel.driverSeat].cardImage,
                  backImage: viewModel.nextRandomPlayingCard.cardImage,
                  isBusCard: true,
                  onPressed: () {},
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${viewModel.driverName}',
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
                            onPressed: () {
                              if (viewModel.onDriverVote(true)) {
                                _playSound('correct_answer.mp3');
                              } else {
                                _playSound('wrong_answer.mp3');
                              }
                              cardKey.currentState!.toggleCard();
                            },
                          ),
                          SizedBox(width: 25),
                          VoteButton(
                            isLower: false,
                            onPressed: () {
                              if (viewModel.onDriverVote(false)) {
                                _playSound('correct_answer.mp3');
                              } else {
                                _playSound('wrong_answer.mp3');
                              }
                              cardKey.currentState!.toggleCard();
                            },
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
