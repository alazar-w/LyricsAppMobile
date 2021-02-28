import 'dart:convert';
import 'dart:io';

import 'package:dalvic_lyrics_sharing_app/data_provider/BaseDataProvider.dart';
import 'package:dalvic_lyrics_sharing_app/helper/localhelper.dart';
import 'package:dalvic_lyrics_sharing_app/models/lyricsrequest.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';

class LyricsRequestDataProvider extends BaseDataProvider{
  final http.Client httpClient;
  final LocalHelper localHelper;


  LyricsRequestDataProvider({@required this.httpClient, @required this.localHelper}):assert(httpClient!=null&&localHelper!=null);

  Future<List<LyricsRequest>> getAllLyricsRequest() async {
    print('user_id: ${localHelper.getUser().id}');
    var response = await httpClient.get('$baseUrl/userlyricsrequest/${localHelper.getUser().id}', headers: {HttpHeaders.authorizationHeader: "Bearer ${localHelper.getUser().token}"});
    List<LyricsRequest> lyricsRequests = new List<LyricsRequest>();

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
    },headers: {HttpHeaders.authorizationHeader: "Bearer ${localHelper.getUser().token}"});
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
    },headers: {HttpHeaders.authorizationHeader: "Bearer ${localHelper.getUser().token}"});
    print(response.body);
    LyricsRequest lyricsRequest = LyricsRequest.fromJson(jsonDecode(response.body)["data"]);
    return lyricsRequest;
  }

  Future<void> deleteRequest({int requestId}) async {
    var response = await httpClient.delete('$baseUrl/lyricsRequest/$requestId', headers: {HttpHeaders.authorizationHeader: "Bearer ${localHelper.getUser().token}"});
    if(response.statusCode == 200){
      return null;
    }else{
      throw Exception("Failed deleting lyrics request");
    }
  }
}