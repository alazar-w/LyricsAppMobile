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
