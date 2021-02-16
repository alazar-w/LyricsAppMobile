import 'dart:convert';
import 'dart:io';

import 'package:dalvic_lyrics_sharing_app/data_provider/BaseDataProvider.dart';
import 'package:dalvic_lyrics_sharing_app/models/lyricsrequest.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class LyricsDataProvider extends BaseDataProvider{
  final http.Client httpClient;
  LyricsDataProvider({@required this.httpClient}):assert(httpClient!=null);

  //Future is a core Dart class for working with async operations. A Future object represents a potential value or error that will be available at some time in the future.
  //the async keyword before a function’s body is to mark it as asynchronous.
  Future<List<LyricsRequest>> getAllLyricsRequest() async {
    //the await keyword to get the completed result of an asynchronous expression. The await keyword only works within an async function.
    var response = await httpClient.get('$baseUrl/lyricsRequest', headers: {HttpHeaders.authorizationHeader: "Bearer 7|Aapx3SyX9PnKyNakMp4581imSeqDpI7T9R5xH3lF"});
    List<LyricsRequest> lyricsRequests = new List<LyricsRequest>();

    //Manual JSON decoding refers to using the built-in JSON decoder in dart:convert.
    //It involves passing the raw JSON string to the jsonDecode() function, and then looking up the values you need in the resulting Map<String, dynamic>.
    List<dynamic> rawData = jsonDecode(response.body)["data"];
    rawData.forEach((element) {
      lyricsRequests.add(LyricsRequest.fromJson(element));
    });
    // for(int i = 0; i < rawData.length; i++){
    //   lyricsRequests.add(LyricsRequest.fromJson(rawData[i]));
    // }
    print(lyricsRequests);
    return lyricsRequests;
  }

  Future<LyricsRequest> createRequest({LyricsRequest request}) async {
    var response = await httpClient.post('$baseUrl/lyricsRequest', body: {
      "music_name": request.musicName,
      "artist_name": request.artistName,
      "url": request.url,
    },headers: {HttpHeaders.authorizationHeader: "Bearer 7|Aapx3SyX9PnKyNakMp4581imSeqDpI7T9R5xH3lF"});
    print(response.body);
    LyricsRequest lyricsRequest = LyricsRequest.fromJson(jsonDecode(response.body)["response"]["requestedLyrics"]);
    return lyricsRequest;
  }

  Future<LyricsRequest> updateRequest({LyricsRequest request}) async {
    var response = await httpClient.post('$baseUrl/lyricsRequest/${request.id}', body: {
      "music_name": request.musicName,
      "artist_name": request.artistName,
      "url": request.url,
      "_method": "PUT",
    },headers: {HttpHeaders.authorizationHeader: "Bearer 7|Aapx3SyX9PnKyNakMp4581imSeqDpI7T9R5xH3lF"});
    print(response.body);
    LyricsRequest lyricsRequest = LyricsRequest.fromJson(jsonDecode(response.body)["data"]);
    return lyricsRequest;
  }

  Future<void> deleteRequest({int requestId}) async {
    var response = await httpClient.delete('$baseUrl/lyricsRequest/$requestId', headers: {HttpHeaders.authorizationHeader: "Bearer 7|Aapx3SyX9PnKyNakMp4581imSeqDpI7T9R5xH3lF"});
    if(response.statusCode == 200){
      return null;
    }else{
      throw Exception("Failed deleting lyrics request");
    }
  }
}