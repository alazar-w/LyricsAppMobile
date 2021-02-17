import 'package:dalvic_lyrics_sharing_app/models/lyricsrequest.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class LyricsRequestEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetSingleRequest extends LyricsRequestEvent{
  final int requestId;
  GetSingleRequest({@required this.requestId}):assert(requestId!=null);
  @override
  // TODO: implement props
  List<Object> get props => [requestId];
}

class GetAllRequest extends LyricsRequestEvent{
  // final int userId;
  // GetAllRequest({@required this.userId}):assert(userId!=null);
}

class CreateRequest extends LyricsRequestEvent{
  final LyricsRequest lyricsRequest;
  CreateRequest({@required this.lyricsRequest}):assert(lyricsRequest!=null);

  @override
  // TODO: implement props
  List<Object> get props => [lyricsRequest];
}

class UpdateRequest extends LyricsRequestEvent{
  final LyricsRequest lyricsRequest;
  UpdateRequest({@required this.lyricsRequest}):assert(lyricsRequest!=null);

  @override
  // TODO: implement props
  List<Object> get props => [lyricsRequest];
}

class DeleteRequest extends LyricsRequestEvent{
  final int requestId;
  DeleteRequest({@required this.requestId}):assert(requestId!=null);

  @override
  // TODO: implement props
  List<Object> get props => [requestId];
}