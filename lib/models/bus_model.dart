import 'dart:math';
import 'package:flutter/material.dart';

import 'package:nebundeva/models/player.dart';
import 'package:nebundeva/models/playing_card.dart';

class BusModel extends ChangeNotifier {
  String _driverName = '';

  int _driverSeat = 0;

  List<PlayingCard> _busPlayingCards = [];
  List<PlayingCard> _availablePlayingCards = [];

  PlayingCard _nextRandomPlayingCard = playingCards[0];

  void initializeModel(Player driver) {
    _driverName = driver.playerName;

    _availablePlayingCards.clear();
    _availablePlayingCards = List.from(playingCards);

    _nextRandomPlayingCard = playingCards[0];
    nextRandomCard();

    for (int i = 0; i < 5; i++) {
      _busPlayingCards.add(_nextRandomPlayingCard);
      nextRandomCard();
    }

    notifyListeners();
  }

  String get driverName {
    return _driverName;
  }

  int get driverSeat {
    return _driverSeat;
  }

  List<PlayingCard> get busPlayingCards {
    return _busPlayingCards;
  }

  PlayingCard get nextRandomPlayingCard {
    return _nextRandomPlayingCard;
  }

  void nextRandomCard() {
    PlayingCard randomCard =
        _availablePlayingCards[Random().nextInt(_availablePlayingCards.length)];

    _availablePlayingCards.remove(randomCard);
    _nextRandomPlayingCard = randomCard;

    notifyListeners();
  }

  bool onDriverVote(bool isLower) {
    PlayingCard currentCard = busPlayingCards[driverSeat];

    if (isLower) {
      if (_nextRandomPlayingCard.cardValue < currentCard.cardValue) {
        return true;
      } else {
        return false;
      }
    } else {
      if (_nextRandomPlayingCard.cardValue > currentCard.cardValue) {
        return true;
      } else {
        return false;
      }
    }
  }
}
