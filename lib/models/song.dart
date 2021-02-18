class Song {
  String music_name;
  String lyrics;
  String url;
  String status;
  String artist_name;
  String user_id;
  String id;

  Song(
      {this.music_name,
      this.lyrics,
      this.artist_name,
      this.user_id,
      this.url,
      this.status,
      this.id});

  factory Song.fromJson(Map<String, dynamic> json) {
    return Song(
      user_id: json['user_id'],
      url: json['url'],
      status: json['status'],
      music_name: json['music_name'],
      lyrics: json['lyrics'],
      artist_name: json['artist_name'],
      id: json['_id'],
    );
  }
}
