import 'package:dalvic_lyrics_sharing_app/data_provider/lyricsdataprovider.dart';
import 'package:dalvic_lyrics_sharing_app/models/lyrics.dart';
import 'package:flutter/foundation.dart';

class LyricsRepository{
  final LyricsDataProvider dataProvider;
  LyricsRepository({@required this.dataProvider}):assert(dataProvider!=null);

  Future<List<Lyrics>> getAllLyrics() async {
    return await dataProvider.getAllLyrics();
  }

  Future<Lyrics> createLyrics({Lyrics request}) async {
    return await dataProvider.createLyrics(request: request);
  }

  Future<Lyrics> updateLyrics({Lyrics request}) async {
    return await dataProvider.updateLyrics(request: request);
  }

  Future<void> deleteLyrics({int requestId}) async {
    return await dataProvider.deleteLyrics(requestId: requestId);
  }
}