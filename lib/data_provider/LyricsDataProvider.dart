import 'dart:convert';
import 'dart:io';

import 'package:dalvic_lyrics_sharing_app/data_provider/BaseDataProvider.dart';
import 'package:dalvic_lyrics_sharing_app/models/Lyrics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class LyricsDataProvider extends BaseDataProvider{
  final http.Client httpClient;

  LyricsDataProvider({@required this.httpClient}):assert(httpClient!=null);

  Future<Lyrics> CreateLyrics(Lyrics lyrics) async{
    print("name: ${lyrics.artistName}");
    print("name: ${lyrics.musicName}");
    print("name: ${lyrics.url}");
    print("name: ${lyrics.lyrics}");

    final response = await httpClient.post(
          "$baseUrl/lyrics",
          body: {
            'music_name': lyrics.musicName,
            'artist_name': lyrics.artistName,
            'lyrics': lyrics.lyrics,
            'url': lyrics.url,
          },
            headers: {HttpHeaders.authorizationHeader: "Bearer 7|Aapx3SyX9PnKyNakMp4581imSeqDpI7T9R5xH3lF"}, );
    // var response = await http.post(
    //     "$baseUrl/lyrics",
    //   body: {
    //       "music_name":"test",
    //     "artist_name":"test",
    //     "lyrics":"test",
    //     "url":"test",
    //   },
    //   headers: {HttpHeaders.authorizationHeader: "Bearer 7|Aapx3SyX9PnKyNakMp4581imSeqDpI7T9R5xH3lF"}
    // );
          print("response: ${response.body}");
        if(response.statusCode==200){
          return Lyrics.fromJson(jsonDecode(response.body)["response"]["lyrics"]);
        }
        else{
          throw Exception('failed to created Lyrics');
        }
  }
  Future<List<Lyrics>> getLyrics() async {
    final response = await httpClient.get('$baseUrl/lyrics', headers: {HttpHeaders.authorizationHeader: "Bearer 7|Aapx3SyX9PnKyNakMp4581imSeqDpI7T9R5xH3lF"});

    if (response.statusCode == 200) {
      List<dynamic> lyrics = jsonDecode(response.body)["body"];
      return lyrics.map((lyrics) => Lyrics.fromJson(lyrics)).toList();
    } else {
      throw Exception('Failed to load lyrics');
    }
  }


}
