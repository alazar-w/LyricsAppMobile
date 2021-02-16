import 'package:dalvic_lyrics_sharing_app/models/lyricsrequest.dart';
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
  final List<LyricsRequest> requests;
  FetchedAllSuccessState({@required this.requests}):assert(requests!=null);
}

class SuccessState extends LyricsRequestState{}

class FailedState extends LyricsRequestState{}

class FetchedSingleSuccessState extends LyricsRequestState{
  final LyricsRequest request;
  FetchedSingleSuccessState({@required this.request}):assert(request!=null);
  @override
  // TODO: implement props
  List<Object> get props => [request];
}

class CreatedSuccessState extends LyricsRequestState{
  final LyricsRequest request;
  CreatedSuccessState({@required this.request}):assert(request!=null);

  @override
  // TODO: implement props
  List<Object> get props => [request];
}

class UpdatedSuccessState extends LyricsRequestState{
  final LyricsRequest request;
  UpdatedSuccessState({@required this.request}):assert(request!=null);

  @override
  // TODO: implement props
  List<Object> get props => [request];
}