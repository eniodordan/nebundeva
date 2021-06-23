import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:nebundeva/models/player.dart';
import 'package:nebundeva/models/playing_card.dart';

import 'package:shared_preferences/shared_preferences.dart';

class NebundevaModel extends ChangeNotifier {
  bool _isBundeva = true;

  List<Player> _players = [];

  int _currentPlayerIndex = 0;

  List<PlayingCard> _availablePlayingCards = [];
  PlayingCard _currentPlayingCard = playingCards[0];

  Future<void> loadPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    _isBundeva = prefs.getBool('isBundeva')!;

    List<String> players = prefs.getStringList('players')!;
    players.forEach((player) {
      _players.add((Player.fromJson(jsonDecode(player))));
    });

    _currentPlayerIndex = prefs.getInt('currentPlayerIndex')!;

    List<String> availablePlayingCards =
        prefs.getStringList('availablePlayingCards')!;
    availablePlayingCards.forEach((playingCard) {
      _availablePlayingCards
          .add((PlayingCard.fromJson(jsonDecode(playingCard))));
    });

    _currentPlayingCard = PlayingCard.fromJson(
        jsonDecode(prefs.getString('currentPlayingCard')!));
  }

  Future<void> initializeModel(bool isBundeva, List<String> playerNames) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setInt('gameProgress', 1);

    _isBundeva = isBundeva;
    await prefs.setBool('isBundeva', _isBundeva);

    _players.clear();
    playerNames.forEach((playerName) {
      _players.add(Player(playerName: playerName));
    });

    List<String> players = [];
    _players.forEach((player) => players.add(jsonEncode(player.toJson())));
    await prefs.setStringList('players', players);

    _currentPlayerIndex = 0;
    await prefs.setInt('currentPlayerIndex', _currentPlayerIndex);

    _availablePlayingCards.clear();
    _availablePlayingCards = List.from(playingCards);

    List<String> availablePlayingCards = [];
    _availablePlayingCards.forEach((playingCard) =>
        availablePlayingCards.add(jsonEncode(playingCard.toJson())));
    await prefs.setStringList('availablePlayingCards', availablePlayingCards);

    _currentPlayingCard = playingCards[0];
    await prefs.setString(
        'currentPlayingCard', jsonEncode(_currentPlayingCard.toJson()));

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

  Future<void> moveToNextPlayer() async {
    final prefs = await SharedPreferences.getInstance();

    if (_currentPlayerIndex + 1 > _players.length - 1) {
      _currentPlayerIndex = 0;
    } else {
      _currentPlayerIndex++;
    }

    await prefs.setInt('currentPlayerIndex', _currentPlayerIndex);

    notifyListeners();
  }

  Future<void> nextRandomCard() async {
    final prefs = await SharedPreferences.getInstance();

    PlayingCard randomCard =
        _availablePlayingCards[Random().nextInt(_availablePlayingCards.length)];

    _availablePlayingCards.remove(randomCard);
    _currentPlayingCard = randomCard;

    List<String> availablePlayingCards = [];
    _availablePlayingCards.forEach((playingCard) =>
        availablePlayingCards.add(jsonEncode(playingCard.toJson())));
    await prefs.setStringList('availablePlayingCards', availablePlayingCards);

    await prefs.setString(
        'currentPlayingCard', jsonEncode(_currentPlayingCard.toJson()));

    notifyListeners();
  }

  Future<void> incrementBellsNumber() async {
    final prefs = await SharedPreferences.getInstance();
    _players[_currentPlayerIndex].bellsNumber++;

    List<String> players = [];
    _players.forEach((player) => players.add(jsonEncode(player.toJson())));
    await prefs.setStringList('players', players);

    notifyListeners();
  }

  void sortPlayers() {
    _players.sort((playerOne, playerTwo) =>
        playerTwo.bellsNumber.compareTo(playerOne.bellsNumber));
  }
}
