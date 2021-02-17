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
        // final response = await httpClient.post(
        //   "$baseUrl/lyrics",
        //   body: {
        //     'music_name': lyrics.musicName,
        //     'artist_name': lyrics.artistName,
        //     'lyrics': lyrics.lyrics,
        //     'url': lyrics.url,
        //   },
        //     headers: {HttpHeaders.authorizationHeader: "Bearer 1|re9gpxoGnrnEPNPy5yWWtfWB6SyioMRCGwDqaiQO"}, );
    var response = await http.post(
        "$baseUrl/lyrics",
        body: {
          'music_name': lyrics.musicName,
          'artist_name': lyrics.artistName,
          'lyrics': lyrics.lyrics,
          'url': lyrics.url,
        },
        headers: {HttpHeaders.authorizationHeader: "Bearer 1|re9gpxoGnrnEPNPy5yWWtfWB6SyioMRCGwDqaiQO"}
    );
          print("resposne${response.body}");
        if(response.statusCode==200){
          return Lyrics.fromJson(jsonDecode(response.body)["response"]["lyrics"]);
        }
        else{
          throw Exception('failed to created Lyrics');
        }
  }
  Future<List<Lyrics>> getCourses() async {
    final response = await httpClient.get('$baseUrl/courses');

    if (response.statusCode == 200) {
      final lyricses = jsonDecode(response.body) as List;
      return lyricses.map((lyrics) => Lyrics.fromJson(lyrics)).toList();
    } else {
      throw Exception('Failed to load courses');
    }
  }


}
