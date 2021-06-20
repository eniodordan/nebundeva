import 'package:flutter/material.dart';
import 'package:nebundeva/constants.dart';
import 'package:provider/provider.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:nebundeva/models/bus_model.dart';

import 'widgets/vote_button.dart';
import 'package:flip_card/flip_card.dart';
import 'package:nebundeva/widgets/card_button.dart';
import 'package:nebundeva/widgets/notification_overlay.dart';

class BusScreen extends StatefulWidget {
  static const String id = 'bus_screen';

  @override
  _BusScreenState createState() => _BusScreenState();
}

class _BusScreenState extends State<BusScreen> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  AudioCache audioCache = AudioCache();
  AudioPlayer? audioPlayer;

  void _showOverlay(BuildContext context) {
    final viewModel = Provider.of<BusModel>(context, listen: false);

    Navigator.of(context).push(
      NotificationOverlay(isPunishment: true, playerName: viewModel.driverName),
    );
  }

  void _playSound(String localPath) async {
    await audioPlayer?.stop();
    audioPlayer = await audioCache.play(localPath);
  }

  void _processVote(int voteOption) {
    final viewModel = Provider.of<BusModel>(context, listen: false);
    bool isChoiceCorrect = viewModel.onDriverVote(voteOption);

    if (isChoiceCorrect) {
      if (viewModel.driverStage > 5) Navigator.pop(context);
      _playSound('correct_answer.mp3');
    } else {
      _showOverlay(context);
      _playSound('wrong_answer.mp3');
    }

    if (viewModel.playingCardsCount == 0) viewModel.refillPlayingCards();

    cardKey.currentState!.toggleCard();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<BusModel>(context);

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Razina: ',
                            style: TextStyle(
                              color: kGreyColour,
                              fontSize: 32,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '${viewModel.driverStage}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 36),
                              ),
                              Text(
                                '/5',
                                style: TextStyle(
                                  color: kLightGreyColour,
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Karte: ',
                            style: TextStyle(
                              color: kGreyColour,
                              fontSize: 32,
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '${viewModel.playingCardsCount}',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 36),
                              ),
                              Text(
                                '/32',
                                style: TextStyle(
                                  color: kLightGreyColour,
                                  fontSize: 22,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  CardButton(
                    cardKey: cardKey,
                    cardImage: viewModel.busPlayingCard.cardImage,
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          VoteButton(
                            buttonIcon: Icons.keyboard_arrow_down,
                            buttonColour: kRedColour,
                            onPressed: () => _processVote(0),
                          ),
                          VoteButton(
                            buttonIcon: Icons.compare_arrows,
                            buttonColour: kYellowColour,
                            onPressed: () => _processVote(1),
                          ),
                          VoteButton(
                            buttonIcon: Icons.keyboard_arrow_up,
                            buttonColour: kGreenColour,
                            onPressed: () => _processVote(2),
                          ),
                        ],
                      ),
                    ],
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
