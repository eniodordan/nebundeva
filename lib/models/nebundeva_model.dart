import 'dart:math';
import 'package:flutter/material.dart';

import 'package:nebundeva/models/player.dart';
import 'package:nebundeva/models/playing_card.dart';

class NebundevaModel extends ChangeNotifier {
  bool _isBundeva = true;

  List<Player> _players = [];

  int _currentPlayerIndex = 0;

  List<PlayingCard> _availablePlayingCards = [];
  PlayingCard _currentPlayingCard = playingCards[0];

  void initializeModel(bool isBundeva, List<String> playerNames) {
    _isBundeva = isBundeva;

    _players.clear();
    playerNames.forEach((playerName) {
      _players.add(Player(playerName: playerName, bellsNumber: 0));
    });

    _currentPlayerIndex = 0;

    _availablePlayingCards.clear();
    _availablePlayingCards = List.from(playingCards);

    _currentPlayingCard = playingCards[0];

    nextRandomCard();

    notifyListeners();
  }

  bool get isBundeva {
    return _isBundeva;
  }

  List<Player> get players {
    return _players;
  }

  Player get currentPlayer {
    return _players[_currentPlayerIndex];
  }

  Player get nextPlayer {
    if (_currentPlayerIndex + 1 > _players.length - 1) {
      return _players[0];
    } else {
      return _players[_currentPlayerIndex + 1];
    }
  }

  PlayingCard get currentPlayingCard {
    return _currentPlayingCard;
  }

  int get playingCardsCount {
    return _availablePlayingCards.length;
  }

  void moveToNextPlayer() {
    if (_currentPlayerIndex + 1 > _players.length - 1) {
      _currentPlayerIndex = 0;
    } else {
      _currentPlayerIndex++;
    }

    notifyListeners();
  }

  void nextRandomCard() {
    PlayingCard randomCard =
        _availablePlayingCards[Random().nextInt(_availablePlayingCards.length)];

    _availablePlayingCards.remove(randomCard);
    _currentPlayingCard = randomCard;

    notifyListeners();
  }

  void incrementBellsNumber() {
    _players[_currentPlayerIndex].bellsNumber++;

    notifyListeners();
  }

  void sortPlayers() {
    _players.sort((playerOne, playerTwo) => playerTwo.bellsNumber.compareTo(playerOne.bellsNumber));
  }
}
