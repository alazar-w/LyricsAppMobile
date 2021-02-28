import 'package:dalvic_lyrics_sharing_app/models/lyrics.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LyricsState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class IdleState extends LyricsState{}

class BusyState extends LyricsState{}

class FetchingBusyState extends LyricsState{}
class UpdatingBusyState extends LyricsState{}
class CreatingBusyState extends LyricsState{}

class FetchedAllSuccessState extends LyricsState{
  final List<Lyrics> lyricss;
  FetchedAllSuccessState({@required this.lyricss}):assert(lyricss!=null);
}

class SuccessState extends LyricsState{}

class FailedState extends LyricsState{}
class FetchingFailedState extends LyricsState{}
class CreatingFailedState extends LyricsState{

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

class UpdatingFailedState extends LyricsState{}

class DeleteSuccessState extends LyricsState{}
class DeleteFailedState extends LyricsState{}

class FetchedSingleSuccessState extends LyricsState{
  final Lyrics lyrics;
  FetchedSingleSuccessState({@required this.lyrics}):assert(lyrics!=null);
  @override
  // TODO: implement props
  List<Object> get props => [lyrics];
}

class CreatedSuccessState extends LyricsState{
  final Lyrics lyrics;
  CreatedSuccessState({@required this.lyrics}):assert(lyrics!=null);

  @override
  // TODO: implement props
  List<Object> get props => [lyrics];
}

class UpdatedSuccessState extends LyricsState{
  final Lyrics lyrics;
  UpdatedSuccessState({@required this.lyrics}):assert(lyrics!=null);

  @override
  // TODO: implement props
  List<Object> get props => [lyrics];
}
class DeleteMyLyricsSuccesState extends LyricsState{}
class DeleteMyLyricsFailedState extends LyricsState{}

