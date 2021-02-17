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
    //   lyrics.add(LyricsRequest.fromJson(rawData[i]));
    // }
    print(lyrics);
    return lyrics;
  }

  Future<Lyrics> createLyrics({Lyrics request}) async {
    print("createLyrics in provider");
    print("artist name: ${request.artistName}");
    print("music name: ${request.musicName}");
    print("url: ${request.url}");
    print("lyrics: ${request.lyrics}");
    var response = await http.post('$baseUrl/lyrics', body: {
      "artist_name":request.artistName,
      "music_name":request.musicName,
      "url":request.url,
      "lyrics":request.lyrics
    }, headers: {HttpHeaders.authorizationHeader: "Bearer 13|RGxVBAcpt9kQXyDF8awsSizDGOar3l8Mlg0jaiTP"});
    print("printing response body ${response.body}");
    Lyrics lyrics = Lyrics.fromJson(jsonDecode(response.body)["response"]["lyrics"]);
    return lyrics;
  }

  Future<Lyrics> updateLyrics({Lyrics request}) async {
    var response = await httpClient.post('$baseUrl/lyrics/${request.id}', body: {
      "music_name": request.musicName,
      "artist_name": request.artistName,
      "lyrics":request.lyrics,
      "url": request.url,
      "_method": "PUT",
    },headers: {HttpHeaders.authorizationHeader: "Bearer 39|NwUITlTzZSXUHYrk95mHD2ypwDarwIgUSoOsNF2k"});
    print(response.body);
    Lyrics lyrics = Lyrics.fromJson(jsonDecode(response.body)["data"]);
    return lyrics;
  }

  Future<void> deleteLyrics({int requestId}) async {
    var response = await httpClient.delete('$baseUrl/lyrics/$requestId', headers: {HttpHeaders.authorizationHeader: "Bearer 39|NwUITlTzZSXUHYrk95mHD2ypwDarwIgUSoOsNF2k"});
    if(response.statusCode == 200){
      return null;
    }else{
      throw Exception("Failed deleting lyrics request");
    }
  }
}