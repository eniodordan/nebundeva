import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nebundeva/constants.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:shake/shake.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:nebundeva/models/nebundeva_model.dart';

import 'package:flip_card/flip_card.dart';
import 'package:nebundeva/widgets/card_button.dart';
import 'package:nebundeva/widgets/notification_overlay.dart';
import 'package:nebundeva/screens/scoreboard_screen/scoreboard_screen.dart';

class GameScreen extends StatefulWidget {
  static const String id = 'game_screen';

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  AudioCache audioCache = AudioCache();
  AudioPlayer? audioPlayer;
  ShakeDetector? shakeDetector;

  void _playSound(String localPath) async {
    await audioPlayer?.stop();
    audioPlayer = await audioCache.play(localPath);
  }

  void _showOverlay(BuildContext context) {
    final viewModel = Provider.of<NebundevaModel>(context, listen: false);

    Navigator.of(context)
        .push(
          NotificationOverlay(
            isPunishment: viewModel.isBundeva,
            playerName: viewModel.currentPlayer.playerName,
          ),
        )
        .then((_) => shakeDetector?.startListening());
  }

  void _bellCheck() {
    final viewModel = Provider.of<NebundevaModel>(context, listen: false);

    if (viewModel.currentPlayingCard.isBell) {
      viewModel.incrementBellsNumber();

      shakeDetector?.stopListening();
      _showOverlay(context);
      if (viewModel.isBundeva) {
        _playSound('can_opener.mp3');
      } else {
        _playSound('aww.mp3');
      }
    }
  }

  void _onPlayerMove() {
    final viewModel = Provider.of<NebundevaModel>(context, listen: false);

    if (viewModel.playingCardsCount > 0) {
      viewModel.moveToNextPlayer();
      viewModel.nextRandomCard();
      _bellCheck();
    } else {
      if (!viewModel.isBundeva) {
        viewModel.sortPlayers();
        Navigator.popAndPushNamed(context, ScoreboardScreen.id);
      } else {
        Navigator.pop(context);
      }
    }
  }

  @override
  void initState() {
    super.initState();

    shakeDetector = ShakeDetector.waitForStart(
      shakeSlopTimeMS: 1000,
      onPhoneShake: () {
        cardKey.currentState!.toggleCard();
      },
    );

    shakeDetector?.startListening();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final bool isFirstTime = ModalRoute.of(context)!.settings.arguments as bool;

      if (isFirstTime) {
        _bellCheck();
      }
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(width: 32),
                          Text(
                            (viewModel.isBundeva && viewModel.currentPlayingCard.isBell) ||
                                    (!viewModel.isBundeva && !viewModel.currentPlayingCard.isBell)
                                ? '${viewModel.currentPlayer.playerName} ${AppLocalizations.of(context)!.drinks}'
                                : '${viewModel.currentPlayer.playerName} ${AppLocalizations.of(context)!.skips}',
                            style: TextStyle(
                              color: (viewModel.isBundeva && viewModel.currentPlayingCard.isBell) ||
                                      (!viewModel.isBundeva && !viewModel.currentPlayingCard.isBell)
                                  ? kRedColour
                                  : kGreenColour,
                              fontSize: 36,
                            ),
                          ),
                          GestureDetector(
                            child: Icon(
                              Icons.restart_alt,
                              size: 32,
                              color: kGreyColour,
                            ),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  content: Text(
                                    AppLocalizations.of(context)!.restartGame,
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      child: Text(
                                        AppLocalizations.of(context)!.no,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: kRedColour,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    TextButton(
                                      child: Text(
                                        AppLocalizations.of(context)!.yes,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: kGreenColour,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${AppLocalizations.of(context)!.bellsNumber}: ',
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
                    cardKey: cardKey,
                    flipOnTouch: true,
                    cardImage: Image.asset(viewModel.currentPlayingCard.cardImagePath),
                    onPressed: _onPlayerMove,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '${AppLocalizations.of(context)!.nextPlayer}: ',
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
                            '${AppLocalizations.of(context)!.cardsLeft}: ',
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
