import 'package:dalvic_lyrics_sharing_app/data_provider/lyricsrequestdataprovider.dart';
import 'package:dalvic_lyrics_sharing_app/models/lyricsrequest.dart';
import 'package:flutter/foundation.dart';

class LyricsRequestRepository{
  final LyricsRequestDataProvider dataProvider;
  LyricsRequestRepository({@required this.dataProvider}):assert(dataProvider!=null);

  Future<List<LyricsRequest>> getAllRequests() async {
    return await dataProvider.getAllLyricsRequest();
  }

  Future<LyricsRequest> createRequest({LyricsRequest request}) async {
    return await dataProvider.createRequest(request: request);
  }

  Future<LyricsRequest> updateRequest({LyricsRequest request}) async {
    return await dataProvider.updateRequest(request: request);
  }
}