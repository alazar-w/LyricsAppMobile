import 'package:dalvic_lyrics_sharing_app/models/Lyrics.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class LyricsState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];

}
class LyricsIdleState extends LyricsState{}
class LyricsBusyState extends LyricsState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LyricsCreateSuccessState extends LyricsState{}
class LyricsSuccesState extends LyricsState{
  final List<Lyrics> lyricses;

  LyricsSuccesState([this.lyricses = const[]]);

  @override
  // TODO: implement props
  List<Object> get props => [lyricses];
}
class LyricsFailedState extends LyricsState{
  final String errorMessage;

  LyricsFailedState({@required this.errorMessage}):assert(errorMessage!=null);
  @override
  // TODO: implement props
  List<Object> get props => [errorMessage];
}


class GetMyLyricsBusyState extends LyricsState{}
class GetMyLyricsSuccessState extends LyricsState{
  final List<Lyrics> lyricss;
  GetMyLyricsSuccessState({@required this.lyricss}):assert(lyricss!=null);

  @override
  // TODO: implement props
  List<Object> get props => [lyricss];
}
class GetMyLyricsFailedState extends LyricsState{}

class UpdateMyLyricsBusyState extends LyricsState{}
class UpdateMyLyricsSuccessState extends LyricsState{

  final Lyrics lyrics;
  UpdateMyLyricsSuccessState({@required this.lyrics}):assert(lyrics!=null);

  @override
  // TODO: implement props
  List<Object> get props => [lyrics];
}
class UpdateMyLyricsFailedState extends LyricsState{}

class DeleteMyLyricsSuccesState extends LyricsState{}
class DeleteMyLyricsFailedState extends LyricsState{}

