class Player {
  String playerName;
  int bellsNumber = 0;

  Player({required this.playerName, bellsNumber});

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      playerName: json['playerName'],
      bellsNumber: json['bellsNumber'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['playerName'] = this.playerName;
    data['bellsNumber'] = this.bellsNumber;
    return data;
  }
}
