import 'dart:math';
import 'package:flutter/material.dart';

import 'package:nebundeva/models/player.dart';
import 'package:nebundeva/models/playing_card.dart';

class BusModel extends ChangeNotifier {
  String _driverName = '';

  int _driverStage = 1;

  List<PlayingCard> _availablePlayingCards = [];
  PlayingCard _busPlayingCard = playingCards[0];

  void initializeModel(Player driver) {
    _driverName = driver.playerName;

    _availablePlayingCards.clear();
    _availablePlayingCards = List.from(playingCards);

    _driverStage = 1;

    _busPlayingCard = playingCards[0];

    nextRandomCard();

    notifyListeners();
  }

  String get driverName {
    return _driverName;
  }

  int get driverStage {
    return _driverStage;
  }

  PlayingCard get busPlayingCard {
    return _busPlayingCard;
  }

  int get playingCardsCount {
    return _availablePlayingCards.length;
  }

  void refillPlayingCards() {
    _availablePlayingCards.clear();
    _availablePlayingCards = List.from(playingCards);

    notifyListeners();
  }

  void nextRandomCard() {
    PlayingCard randomCard =
        _availablePlayingCards[Random().nextInt(_availablePlayingCards.length)];

    _availablePlayingCards.remove(randomCard);
    _busPlayingCard = randomCard;

    notifyListeners();
  }

  bool onDriverVote(int voteOption) {
    PlayingCard currentCard = _busPlayingCard;
    nextRandomCard();

    if (voteOption == 0) {
      if (_busPlayingCard.cardValue < currentCard.cardValue) {
        _driverStage++;
        return true;
      } else {
        _driverStage = 1;
        return false;
      }
    } else if (voteOption == 1) {
      if (_busPlayingCard.cardValue == currentCard.cardValue) {
        _driverStage++;
        return true;
      } else {
        _driverStage = 1;
        return false;
      }
    } else {
      if (_busPlayingCard.cardValue > currentCard.cardValue) {
        _driverStage++;
        return true;
      } else {
        _driverStage = 1;
        return false;
      }
    }
  }
}
