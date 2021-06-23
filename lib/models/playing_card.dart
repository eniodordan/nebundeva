// import 'dart:convert';

class PlayingCard {
  bool isBell;
  int cardValue;
  String cardImagePath;

  PlayingCard({
    required this.isBell,
    required this.cardValue,
    required this.cardImagePath,
  });

  factory PlayingCard.fromJson(Map<String, dynamic> json) {
    return PlayingCard(
      isBell: json['isBell'],
      cardValue: json['cardValue'],
      cardImagePath: json['cardImage'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isBell'] = this.isBell;
    data['cardValue'] = this.cardValue;
    data['cardImage'] = this.cardImagePath;
    return data;
  }
}

final List<PlayingCard> playingCards = [
  // Bells
  PlayingCard(
    isBell: true,
    cardValue: 7,
    cardImagePath: 'images/seven_of_bells.jpg',
  ),
  PlayingCard(
    isBell: true,
    cardValue: 8,
    cardImagePath: 'images/eight_of_bells.jpg',
  ),
  PlayingCard(
    isBell: true,
    cardValue: 9,
    cardImagePath: 'images/nine_of_bells.jpg',
  ),
  PlayingCard(
    isBell: true,
    cardValue: 10,
    cardImagePath: 'images/ten_of_bells.jpg',
  ),
  PlayingCard(
    isBell: true,
    cardValue: 11,
    cardImagePath: 'images/jack_of_bells.jpg',
  ),
  PlayingCard(
    isBell: true,
    cardValue: 12,
    cardImagePath: 'images/queen_of_bells.jpg',
  ),
  PlayingCard(
    isBell: true,
    cardValue: 13,
    cardImagePath: 'images/king_of_bells.jpg',
  ),
  PlayingCard(
    isBell: true,
    cardValue: 14,
    cardImagePath: 'images/ace_of_bells.jpg',
  ),

  // Heart
  PlayingCard(
    isBell: false,
    cardValue: 7,
    cardImagePath: 'images/seven_of_hearts.jpg',
  ),
  PlayingCard(
    isBell: false,
    cardValue: 8,
    cardImagePath: 'images/eight_of_hearts.jpg',
  ),
  PlayingCard(
    isBell: false,
    cardValue: 9,
    cardImagePath: 'images/nine_of_hearts.jpg',
  ),
  PlayingCard(
    isBell: false,
    cardValue: 10,
    cardImagePath: 'images/ten_of_hearts.jpg',
  ),
  PlayingCard(
    isBell: false,
    cardValue: 11,
    cardImagePath: 'images/jack_of_hearts.jpg',
  ),
  PlayingCard(
    isBell: false,
    cardValue: 12,
    cardImagePath: 'images/queen_of_hearts.jpg',
  ),
  PlayingCard(
    isBell: false,
    cardValue: 13,
    cardImagePath: 'images/king_of_hearts.jpg',
  ),
  PlayingCard(
    isBell: false,
    cardValue: 14,
    cardImagePath: 'images/ace_of_hearts.jpg',
  ),

  // Leaf
  PlayingCard(
    isBell: false,
    cardValue: 7,
    cardImagePath: 'images/seven_of_leaves.jpg',
  ),
  PlayingCard(
    isBell: false,
    cardValue: 8,
    cardImagePath: 'images/eight_of_leaves.jpg',
  ),
  PlayingCard(
    isBell: false,
    cardValue: 9,
    cardImagePath: 'images/nine_of_leaves.jpg',
  ),
  PlayingCard(
    isBell: false,
    cardValue: 10,
    cardImagePath: 'images/ten_of_leaves.jpg',
  ),
  PlayingCard(
    isBell: false,
    cardValue: 11,
    cardImagePath: 'images/jack_of_leaves.jpg',
  ),
  PlayingCard(
    isBell: false,
    cardValue: 12,
    cardImagePath: 'images/queen_of_leaves.jpg',
  ),
  PlayingCard(
    isBell: false,
    cardValue: 13,
    cardImagePath: 'images/king_of_leaves.jpg',
  ),
  PlayingCard(
    isBell: false,
    cardValue: 14,
    cardImagePath: 'images/ace_of_leaves.jpg',
  ),

  // Acorn
  PlayingCard(
    isBell: false,
    cardValue: 7,
    cardImagePath: 'images/seven_of_acorns.jpg',
  ),
  PlayingCard(
    isBell: false,
    cardValue: 8,
    cardImagePath: 'images/eight_of_acorns.jpg',
  ),
  PlayingCard(
    isBell: false,
    cardValue: 9,
    cardImagePath: 'images/nine_of_acorns.jpg',
  ),
  PlayingCard(
    isBell: false,
    cardValue: 10,
    cardImagePath: 'images/ten_of_acorns.jpg',
  ),
  PlayingCard(
    isBell: false,
    cardValue: 11,
    cardImagePath: 'images/jack_of_acorns.jpg',
  ),
  PlayingCard(
    isBell: false,
    cardValue: 12,
    cardImagePath: 'images/queen_of_acorns.jpg',
  ),
  PlayingCard(
    isBell: false,
    cardValue: 13,
    cardImagePath: 'images/king_of_acorns.jpg',
  ),
  PlayingCard(
    isBell: false,
    cardValue: 14,
    cardImagePath: 'images/ace_of_acorns.jpg',
  ),
];
