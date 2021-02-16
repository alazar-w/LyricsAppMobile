import 'package:dalvic_lyrics_sharing_app/models/lyrics.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LyricsRequestState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class IdleState extends LyricsRequestState{}

class BusyState extends LyricsRequestState{}

class FetchingBusyState extends LyricsRequestState{}
class UpdatingBusyState extends LyricsRequestState{}
class CreatingBusyState extends LyricsRequestState{}

class FetchedAllSuccessState extends LyricsRequestState{
  final List<Lyrics> requests;
  FetchedAllSuccessState({@required this.requests}):assert(requests!=null);
}

class SuccessState extends LyricsRequestState{}

class FailedState extends LyricsRequestState{}
class FetchingFailedState extends LyricsRequestState{}
class CreatingFailedState extends LyricsRequestState{}
class UpdatingFailedState extends LyricsRequestState{}

class DeleteSuccessState extends LyricsRequestState{}
class DeleteFailedState extends LyricsRequestState{}

class FetchedSingleSuccessState extends LyricsRequestState{
  final Lyrics request;
  FetchedSingleSuccessState({@required this.request}):assert(request!=null);
  @override
  // TODO: implement props
  List<Object> get props => [request];
}

class CreatedSuccessState extends LyricsRequestState{
  final Lyrics request;
  CreatedSuccessState({@required this.request}):assert(request!=null);

  @override
  // TODO: implement props
  List<Object> get props => [request];
}

class UpdatedSuccessState extends LyricsRequestState{
  final Lyrics request;
  UpdatedSuccessState({@required this.request}):assert(request!=null);

  @override
  // TODO: implement props
  List<Object> get props => [request];
}