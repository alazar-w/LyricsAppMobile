import 'package:dalvic_lyrics_sharing_app/data_provider/LyricsDataProvider.dart';
import 'package:dalvic_lyrics_sharing_app/models/Lyrics.dart';
import 'package:flutter/cupertino.dart';

class LyricsRepository {
  LyricsDataProvider dataProvider;

  LyricsRepository({@required this.dataProvider}):assert(dataProvider!=null);

  Future<Lyrics> CreateLyrics(Lyrics lyrics) async{
      return await dataProvider.CreateLyrics(lyrics);
  }
  Future<List<Lyrics>> GetLyrics() async {
    return await dataProvider.getLyrics();
  }
}