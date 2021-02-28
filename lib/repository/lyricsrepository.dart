import 'package:dalvic_lyrics_sharing_app/data_provider/lyricsdataprovider.dart';
import 'package:dalvic_lyrics_sharing_app/models/lyrics.dart';
import 'package:flutter/foundation.dart';

class LyricsRepository{
  final LyricsDataProvider dataProvider;
  LyricsRepository({@required this.dataProvider}):assert(dataProvider!=null);

  Future<List<Lyrics>> getAllLyrics() async {
    return await dataProvider.getAllLyrics();
  }

  Future<List<Lyrics>> getMyLyrics() async {
    return await dataProvider.getMyLyrics();
  }

  Future<Lyrics> createLyrics({Lyrics lyrics}) async {
    return await dataProvider.createLyrics(lyrics: lyrics);
  }

  Future<Lyrics> updateLyrics({Lyrics lyrics}) async {
    return await dataProvider.updateLyrics(lyrics: lyrics);
  }

  Future<Lyrics> updateMyLyrics({Lyrics lyrics}) async {
    return await dataProvider.updateMyLyrics(lyrics: lyrics);
  }

  Future<void> deleteLyrics({int lyricsId}) async {
    return await dataProvider.deleteLyrics(lyricsId: lyricsId);
  }
}