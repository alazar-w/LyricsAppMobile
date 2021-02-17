import 'package:dalvic_lyrics_sharing_app/models/lyrics.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class LyricsEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetSingleLyrics extends LyricsEvent{
  final int requestId;
  GetSingleLyrics({@required this.requestId}):assert(requestId!=null);
  @override
  // TODO: implement props
  List<Object> get props => [requestId];
}

class GetAllLyrics extends LyricsEvent{
  // final int userId;
  // GetAllRequest({@required this.userId}):assert(userId!=null);
}

class CreateLyrics extends LyricsEvent{
  final Lyrics lyricsRequest;
  CreateLyrics({@required this.lyricsRequest}):assert(lyricsRequest!=null);

  @override
  // TODO: implement props
  List<Object> get props => [lyricsRequest];
}

class UpdateLyrics extends LyricsEvent{
  final Lyrics lyricsRequest;
  UpdateLyrics({@required this.lyricsRequest}):assert(lyricsRequest!=null);

  @override
  // TODO: implement props
  List<Object> get props => [lyricsRequest];
}

class DeleteLyrics extends LyricsEvent{
  final int requestId;
  DeleteLyrics({@required this.requestId}):assert(requestId!=null);

  @override
  // TODO: implement props
  List<Object> get props => [requestId];
}