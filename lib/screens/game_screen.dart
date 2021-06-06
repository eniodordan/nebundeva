import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nebundeva/constants.dart';

import 'package:nebundeva/models/nebundeva_model.dart';
import 'package:nebundeva/widgets/notification_overlay.dart';

import 'package:nebundeva/screens/scoreboard_screen.dart';

import 'package:shake/shake.dart';

class GameScreen extends StatefulWidget {
  static const String id = 'game_screen';

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  ShakeDetector? shakeDetector;

  void _showOverlay(BuildContext context) {
    Provider.of<NebundevaModel>(context, listen: false).isBundeva
        ? Navigator.of(context).push(
            NotificationOverlay(
              overlayColour: kRedColour,
              notificationMessage:
                  '${Provider.of<NebundevaModel>(context, listen: false).currentPlayer.playerName} PIJE',
            ),
          )
        : Navigator.of(context).push(
            NotificationOverlay(
              overlayColour: kGreenColour,
              notificationMessage:
                  '${Provider.of<NebundevaModel>(context, listen: false).currentPlayer.playerName} NE PIJE',
            ),
          );
  }

  void _bellsCheck() {
    if (Provider.of<NebundevaModel>(context, listen: false)
        .currentPlayingCard
        .isBell) {
      Provider.of<NebundevaModel>(context, listen: false)
          .currentPlayer
          .bellsNumber++;

      _showOverlay(context);
    }
  }

  void _playerMove() {
    if (Provider.of<NebundevaModel>(context, listen: false).playingCardsCount >
        0) {
      Provider.of<NebundevaModel>(context, listen: false).moveToNextPlayer();
      Provider.of<NebundevaModel>(context, listen: false).nextRandomCard();
      _bellsCheck();
    } else {
      if (!Provider.of<NebundevaModel>(context, listen: false).isBundeva) {
        Provider.of<NebundevaModel>(context, listen: false).sortPlayers();
        Navigator.popAndPushNamed(context, ScoreboardScreen.id);
      } else {
        Navigator.pop(context);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) => _bellsCheck());
    shakeDetector = ShakeDetector.waitForStart(onPhoneShake: () {
      _playerMove();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NebundevaModel>(context);

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
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            (viewModel.isBundeva &&
                                        viewModel.currentPlayingCard.isBell) ||
                                    (!viewModel.isBundeva &&
                                        !viewModel.currentPlayingCard.isBell)
                                ? '${viewModel.currentPlayer.playerName} PIJE'
                                : '${viewModel.currentPlayer.playerName} NE PIJE',
                            style: TextStyle(
                              color: (viewModel.isBundeva &&
                                          viewModel
                                              .currentPlayingCard.isBell) ||
                                      (!viewModel.isBundeva &&
                                          !viewModel.currentPlayingCard.isBell)
                                  ? kRedColour
                                  : kGreenColour,
                              fontSize: 36,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Broj bundevi: ',
                            style: TextStyle(
                              color: kLightGreyColour,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            '${viewModel.currentPlayer.bellsNumber}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  CardButton(
                    cardImage: viewModel.currentPlayingCard.cardImage,
                    onPressed: _playerMove,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Sljedeći: ',
                            style: TextStyle(
                              color: kLightGreyColour,
                              fontSize: 42,
                            ),
                          ),
                          Text(
                            '${viewModel.nextPlayer.playerName}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 42,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Karata preostalo: ',
                            style: TextStyle(
                              color: kGreyColour,
                              fontSize: 24,
                            ),
                          ),
                          Text(
                            '${viewModel.playingCardsCount}',
                            style: TextStyle(
                              color: kLightGreyColour,
                              fontSize: 24,
                            ),
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

  @override
  void dispose() {
    shakeDetector?.stopListening();
    super.dispose();
  }
}

class CardButton extends StatelessWidget {
  final Image cardImage;
  final VoidCallback onPressed;

  CardButton({required this.cardImage, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Container(
            height: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: cardImage,
            ),
          ),
        ),
        onTap: onPressed,
      ),
    );
  }
}
