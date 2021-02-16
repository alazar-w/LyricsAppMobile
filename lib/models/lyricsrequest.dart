class LyricsRequest{
  String musicName;
  String artistName;
  String url;
  int id;

  LyricsRequest({this.musicName, this.artistName, this.url, this.id});

  //change the Map<string,dynamic> json response into LyricsRequest Model
  factory LyricsRequest.fromJson(Map<String, dynamic> json){
    return LyricsRequest(
      musicName: json['music_name'],
      artistName: json['artist_name'],
      url: json['url'],
      id: json['id']
    );
  }
}