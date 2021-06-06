import 'package:flutter/material.dart';

class PlayingCard {
  bool isBell;
  int cardValue;
  Image cardImage;

  PlayingCard({
    required this.isBell,
    required this.cardValue,
    required this.cardImage,
  });
}

final List<PlayingCard> playingCards = [
  // Bells
  PlayingCard(
    isBell: true,
    cardValue: 7,
    cardImage: Image.asset('images/seven_of_bells.jpg'),
  ),
  PlayingCard(
    isBell: true,
    cardValue: 8,
    cardImage: Image.asset('images/eight_of_bells.jpg'),
  ),
  PlayingCard(
    isBell: true,
    cardValue: 9,
    cardImage: Image.asset('images/nine_of_bells.jpg'),
  ),
  PlayingCard(
    isBell: true,
    cardValue: 10,
    cardImage: Image.asset('images/ten_of_bells.jpg'),
  ),
  PlayingCard(
    isBell: true,
    cardValue: 11,
    cardImage: Image.asset('images/jack_of_bells.jpg'),
  ),
  PlayingCard(
    isBell: true,
    cardValue: 12,
    cardImage: Image.asset('images/queen_of_bells.jpg'),
  ),
  PlayingCard(
    isBell: true,
    cardValue: 13,
    cardImage: Image.asset('images/king_of_bells.jpg'),
  ),
  PlayingCard(
    isBell: true,
    cardValue: 14,
    cardImage: Image.asset('images/ace_of_bells.jpg'),
  ),

  // Heart
  PlayingCard(
    isBell: false,
    cardValue: 7,
    cardImage: Image.asset('images/seven_of_hearts.jpg'),
  ),
  PlayingCard(
    isBell: false,
    cardValue: 8,
    cardImage: Image.asset('images/eight_of_hearts.jpg'),
  ),
  PlayingCard(
    isBell: false,
    cardValue: 9,
    cardImage: Image.asset('images/nine_of_hearts.jpg'),
  ),
  PlayingCard(
    isBell: false,
    cardValue: 10,
    cardImage: Image.asset('images/ten_of_hearts.jpg'),
  ),
  PlayingCard(
    isBell: false,
    cardValue: 11,
    cardImage: Image.asset('images/jack_of_hearts.jpg'),
  ),
  PlayingCard(
    isBell: false,
    cardValue: 12,
    cardImage: Image.asset('images/queen_of_hearts.jpg'),
  ),
  PlayingCard(
    isBell: false,
    cardValue: 13,
    cardImage: Image.asset('images/king_of_hearts.jpg'),
  ),
  PlayingCard(
    isBell: false,
    cardValue: 14,
    cardImage: Image.asset('images/ace_of_hearts.jpg'),
  ),

  // Leaf
  PlayingCard(
    isBell: false,
    cardValue: 7,
    cardImage: Image.asset('images/seven_of_leaves.jpg'),
  ),
  PlayingCard(
    isBell: false,
    cardValue: 8,
    cardImage: Image.asset('images/eight_of_leaves.jpg'),
  ),
  PlayingCard(
    isBell: false,
    cardValue: 9,
    cardImage: Image.asset('images/nine_of_leaves.jpg'),
  ),
  PlayingCard(
    isBell: false,
    cardValue: 10,
    cardImage: Image.asset('images/ten_of_leaves.jpg'),
  ),
  PlayingCard(
    isBell: false,
    cardValue: 11,
    cardImage: Image.asset('images/jack_of_leaves.jpg'),
  ),
  PlayingCard(
    isBell: false,
    cardValue: 12,
    cardImage: Image.asset('images/queen_of_leaves.jpg'),
  ),
  PlayingCard(
    isBell: false,
    cardValue: 13,
    cardImage: Image.asset('images/king_of_leaves.jpg'),
  ),
  PlayingCard(
    isBell: false,
    cardValue: 14,
    cardImage: Image.asset('images/ace_of_leaves.jpg'),
  ),

  // Acorn
  PlayingCard(
    isBell: false,
    cardValue: 7,
    cardImage: Image.asset('images/seven_of_acorns.jpg'),
  ),
  PlayingCard(
    isBell: false,
    cardValue: 8,
    cardImage: Image.asset('images/eight_of_acorns.jpg'),
  ),
  PlayingCard(
    isBell: false,
    cardValue: 9,
    cardImage: Image.asset('images/nine_of_acorns.jpg'),
  ),
  PlayingCard(
    isBell: false,
    cardValue: 10,
    cardImage: Image.asset('images/ten_of_acorns.jpg'),
  ),
  PlayingCard(
    isBell: false,
    cardValue: 11,
    cardImage: Image.asset('images/jack_of_acorns.jpg'),
  ),
  PlayingCard(
    isBell: false,
    cardValue: 12,
    cardImage: Image.asset('images/queen_of_acorns.jpg'),
  ),
  PlayingCard(
    isBell: false,
    cardValue: 13,
    cardImage: Image.asset('images/king_of_acorns.jpg'),
  ),
  PlayingCard(
    isBell: false,
    cardValue: 14,
    cardImage: Image.asset('images/ace_of_acorns.jpg'),
  ),
];
