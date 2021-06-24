import 'dart:math';
import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:nebundeva/models/player.dart';
import 'package:nebundeva/models/playing_card.dart';

import 'package:shared_preferences/shared_preferences.dart';

class BusModel extends ChangeNotifier {
  String _driverName = '';

  int _driverStage = 1;

  List<PlayingCard> _availablePlayingCards = [];
  PlayingCard _busPlayingCard = playingCards[0];

  Future<void> initializePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _driverName = prefs.getString('driverName')!;
    _driverStage = prefs.getInt('driverStage')!;

    List<String> availablePlayingCards =
        prefs.getStringList('availablePlayingCards')!;
    availablePlayingCards.forEach((playingCard) {
      _availablePlayingCards
          .add((PlayingCard.fromJson(jsonDecode(playingCard))));
    });

    _busPlayingCard =
        PlayingCard.fromJson(jsonDecode(prefs.getString('busPlayingCard')!));
  }

  Future<void> initializeModel(Player driver) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt('gameProgress', 2);

    _driverName = driver.playerName;
    await prefs.setString('driverName', _driverName);

    _availablePlayingCards.clear();
    _availablePlayingCards = List.from(playingCards);

    List<String> availablePlayingCards = [];
    _availablePlayingCards.forEach((playingCard) =>
        availablePlayingCards.add(jsonEncode(playingCard.toJson())));
    await prefs.setStringList('availablePlayingCards', availablePlayingCards);

    _driverStage = 1;
    await prefs.setInt('driverStage', 1);

    _busPlayingCard = playingCards[0];
    await prefs.setString(
        'busPlayingCard', jsonEncode(_busPlayingCard.toJson()));

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

  Future<void> refillPlayingCards() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    _availablePlayingCards.clear();
    _availablePlayingCards = List.from(playingCards);

    List<String> availablePlayingCards = [];
    _availablePlayingCards.forEach((playingCard) =>
        availablePlayingCards.add(jsonEncode(playingCard.toJson())));
    await prefs.setStringList('availablePlayingCards', availablePlayingCards);

    notifyListeners();
  }

  Future<void> nextRandomCard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    PlayingCard randomCard =
        _availablePlayingCards[Random().nextInt(_availablePlayingCards.length)];

    _availablePlayingCards.remove(randomCard);
    _busPlayingCard = randomCard;

    List<String> availablePlayingCards = [];
    _availablePlayingCards.forEach((playingCard) =>
        availablePlayingCards.add(jsonEncode(playingCard.toJson())));
    await prefs.setStringList('availablePlayingCards', availablePlayingCards);

    await prefs.setString(
        'busPlayingCard', jsonEncode(_busPlayingCard.toJson()));

    notifyListeners();
  }

  Future<bool> onDriverVote(int voteOption) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    PlayingCard currentCard = _busPlayingCard;
    await nextRandomCard();

    if (voteOption == 0) {
      if (_busPlayingCard.cardValue < currentCard.cardValue) {
        _driverStage++;
        await prefs.setInt('driverStage', _driverStage);
        return true;
      } else {
        _driverStage = 1;
        await prefs.setInt('driverStage', _driverStage);
        return false;
      }
    } else if (voteOption == 1) {
      if (_busPlayingCard.cardValue == currentCard.cardValue) {
        _driverStage++;
        await prefs.setInt('driverStage', _driverStage);
        return true;
      } else {
        _driverStage = 1;
        await prefs.setInt('driverStage', _driverStage);
        return false;
      }
    } else {
      if (_busPlayingCard.cardValue > currentCard.cardValue) {
        _driverStage++;
        await prefs.setInt('driverStage', _driverStage);
        return true;
      } else {
        _driverStage = 1;
        await prefs.setInt('driverStage', _driverStage);
        return false;
      }
    }
  }
}
