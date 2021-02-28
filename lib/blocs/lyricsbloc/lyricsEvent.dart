import 'package:dalvic_lyrics_sharing_app/models/Lyrics.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class LyricsEvents extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class CreateLyricsEvent extends LyricsEvents{
 final Lyrics lyrics;

  CreateLyricsEvent({@required this.lyrics});
  @override
  // TODO: implement props
  List<Object> get props => [lyrics];

}
class GetAllLyrics extends LyricsEvents{
}

class GetMyLyrics extends LyricsEvents{
}

class DeleteMyLyrics extends LyricsEvents{
  final int lyricsId;
  DeleteMyLyrics({@required this.lyricsId}):assert(lyricsId!=null);

  @override
  // TODO: implement props
  List<Object> get props => [lyricsId];
}

class UpdateMyLyrics extends LyricsEvents{
  final Lyrics lyrics;
  UpdateMyLyrics({@required this.lyrics}):assert(lyrics!=null);

  @override
  // TODO: implement props
  List<Object> get props => [lyrics];

}

