import 'package:dalvic_lyrics_sharing_app/models/lyrics.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class LyricsEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class GetSingleLyrics extends LyricsEvent{
  final int lyricsId;
  GetSingleLyrics({@required this.lyricsId}):assert(lyricsId!=null);
  @override
  // TODO: implement props
  List<Object> get props => [lyricsId];
}

class GetAllLyrics extends LyricsEvent{
  // final int userId;
  // GetAllRequest({@required this.userId}):assert(userId!=null);
}

class CreateLyrics extends LyricsEvent{
  final Lyrics lyrics;
  CreateLyrics({@required this.lyrics}):assert(lyrics!=null);

  @override
  // TODO: implement props
  List<Object> get props => [lyrics];
}

class UpdateLyrics extends LyricsEvent{
  final Lyrics lyrics;
  UpdateLyrics({@required this.lyrics}):assert(lyrics!=null);

  @override
  // TODO: implement props
  List<Object> get props => [lyrics];
}

class DeleteLyrics extends LyricsEvent{
  final int lyricsId;
  DeleteLyrics({@required this.lyricsId}):assert(lyricsId!=null);

  @override
  // TODO: implement props
  List<Object> get props => [lyricsId];
}

class GetMyLyrics extends LyricsEvent{
}
class DeleteMyLyrics extends LyricsEvent{
  final int lyricsId;
  DeleteMyLyrics({@required this.lyricsId}):assert(lyricsId!=null);

  @override
  // TODO: implement props
  List<Object> get props => [lyricsId];
}
class UpdateMyLyrics extends LyricsEvent{
  final Lyrics lyrics;
  UpdateMyLyrics({@required this.lyrics}):assert(lyrics!=null);

  @override
  // TODO: implement props
  List<Object> get props => [lyrics];

}