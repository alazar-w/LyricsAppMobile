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
  final List<Lyrics> requests;
  FetchedAllSuccessState({@required this.requests}):assert(requests!=null);
}

class SuccessState extends LyricsState{}

class FailedState extends LyricsState{}
class FetchingFailedState extends LyricsState{}
class CreatingFailedState extends LyricsState{}
class UpdatingFailedState extends LyricsState{}

class DeleteSuccessState extends LyricsState{}
class DeleteFailedState extends LyricsState{}

class FetchedSingleSuccessState extends LyricsState{
  final Lyrics request;
  FetchedSingleSuccessState({@required this.request}):assert(request!=null);
  @override
  // TODO: implement props
  List<Object> get props => [request];
}

class CreatedSuccessState extends LyricsState{
  final Lyrics request;
  CreatedSuccessState({@required this.request}):assert(request!=null);

  @override
  // TODO: implement props
  List<Object> get props => [request];
}

class UpdatedSuccessState extends LyricsState{
  final Lyrics request;
  UpdatedSuccessState({@required this.request}):assert(request!=null);

  @override
  // TODO: implement props
  List<Object> get props => [request];
}