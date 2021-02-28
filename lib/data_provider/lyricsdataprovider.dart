import 'dart:convert';
import 'dart:io';

import 'package:dalvic_lyrics_sharing_app/data_provider/BaseDataProvider.dart';
import 'package:dalvic_lyrics_sharing_app/models/lyrics.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class LyricsDataProvider extends BaseDataProvider{
  final http.Client httpClient;
  LyricsDataProvider({@required this.httpClient}):assert(httpClient!=null);

  //Future is a core Dart class for working with async operations. A Future object represents a potential value or error that will be available at some time in the future.
  //the async keyword before a function’s body is to mark it as asynchronous.
  Future<List<Lyrics>> getAllLyrics() async {
    //the await keyword to get the completed result of an asynchronous expression. The await keyword only works within an async function.
    var response = await httpClient.get('$baseUrl/lyrics', headers: {HttpHeaders.authorizationHeader: "Bearer 11|Eh8W6UM9O9FZUN9oSsuoaWF0u1a1SalKyndQF0ZP"});
    List<Lyrics> lyrics = new List<Lyrics>();

    //Manual JSON decoding refers to using the built-in JSON decoder in dart:convert.
    //It involves passing the raw JSON string to the jsonDecode() function, and then looking up the values you need in the resulting Map<String, dynamic>.
    List<dynamic> rawData = jsonDecode(response.body)["data"];
    rawData.forEach((element) {
      lyrics.add(Lyrics.fromJson(element));
    });
    // for(int i = 0; i < rawData.length; i++){
    //   lyrics.add(Lyricslyrics.fromJson(rawData[i]));
    // }
    print(lyrics);
    return lyrics;
  }
  Future<List<Lyrics>> getMyLyrics() async {
    //the await keyword to get the completed result of an asynchronous expression. The await keyword only works within an async function.
    var response = await httpClient.get('$baseUrl/userlyrics/12', headers: {HttpHeaders.authorizationHeader: "Bearer 16|Q61zan5cE3aNZ8uMbrSBIkEEekhUsfdIHBRUMBiH"});
    List<Lyrics> lyrics = new List<Lyrics>();

    //Manual JSON decoding refers to using the built-in JSON decoder in dart:convert.
    //It involves passing the raw JSON string to the jsonDecode() function, and then looking up the values you need in the resulting Map<String, dynamic>.
    List<dynamic> rawData = jsonDecode(response.body)["data"];
    rawData.forEach((element) {
      lyrics.add(Lyrics.fromJson(element));
    });
    // for(int i = 0; i < rawData.length; i++){
    //   lyrics.add(Lyricslyrics.fromJson(rawData[i]));
    // }
    print(lyrics);
    return lyrics;
  }

  Future<Lyrics> createLyrics({Lyrics lyrics}) async {
    print("artist name: ${lyrics.artistName}");
    print("music name: ${lyrics.musicName}");
    print("url: ${lyrics.url}");
    print("Lyrics: ${lyrics.lyrics}");
    var response = await http.post('$baseUrl/lyrics', body: {
      "artist_name":lyrics.artistName,
      "music_name":lyrics.musicName,
      "url":lyrics.url,
      "lyrics":lyrics.lyrics
    }, headers: {HttpHeaders.authorizationHeader: "Bearer 16|Q61zan5cE3aNZ8uMbrSBIkEEekhUsfdIHBRUMBiH"});
    print("printing response body ${response.body}");
    Lyrics lyric = Lyrics.fromJson(jsonDecode(response.body)["response"]["lyrics"]);
    return lyric;
  }
  //
  Future<Lyrics> updateLyrics({Lyrics lyrics}) async {
    var response = await httpClient.post('$baseUrl/lyrics/${lyrics.id}', body: {
      "music_name": lyrics.musicName,
      "artist_name": lyrics.artistName,
      "lyrics":lyrics.lyrics,
      "url": lyrics.url,
      "_method": "PUT",
    },headers: {HttpHeaders.authorizationHeader: "Bearer 39|NwUITlTzZSXUHYrk95mHD2ypwDarwIgUSoOsNF2k"});
    print(response.body);
    Lyrics lyric = Lyrics.fromJson(jsonDecode(response.body)["data"]);
    return lyric;
  }

  Future<Lyrics> updateMyLyrics({Lyrics lyrics}) async {
    var response = await httpClient.post('$baseUrl/lyrics/${lyrics.id}', body: {
      "music_name": lyrics.musicName,
      "artist_name": lyrics.artistName,
      "lyrics":lyrics.lyrics,
      "url": lyrics.url,
      "_method": "PUT",
    },headers: {HttpHeaders.authorizationHeader: "Bearer 16|Q61zan5cE3aNZ8uMbrSBIkEEekhUsfdIHBRUMBiH"});
    print(response.body);
    Lyrics lyric = Lyrics.fromJson(jsonDecode(response.body)["data"]);
    return lyric;
  }


  Future<void> deleteLyrics({int lyricsId}) async {
    var response = await httpClient.delete('$baseUrl/lyrics/$lyricsId', headers: {HttpHeaders.authorizationHeader: "Bearer 16|Q61zan5cE3aNZ8uMbrSBIkEEekhUsfdIHBRUMBiH"});
    if(response.statusCode == 200){
      return null;
    }else{
      throw Exception("Failed deleting lyrics lyrics");
    }
  }
}