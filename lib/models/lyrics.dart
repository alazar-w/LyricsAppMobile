class Lyrics{
  String musicName;
  String artistName;
  String lyrics;
  String url;
  int id;

  Lyrics({this.musicName, this.artistName, this.lyrics,this.url,this.id});

  //change the Map<string,dynamic> json response into LyricsRequest Model
  factory Lyrics.fromJson(Map<String, dynamic> json){
    return Lyrics(
        musicName: json['music_name'],
        artistName: json['artist_name'],
        lyrics: json['lyrics'],
        url: json['url'],
        id: json['id']
    );
  }
}