class Favorite {
  String user_id;
  String song_id;

  Favorite({this.user_id, this.song_id});

  factory Favorite.fromJson(Map<String, dynamic> json) {
    return Favorite(
      user_id: json['user_id'],
      song_id: json['song_id'],
    );
  }
}
