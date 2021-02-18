import 'package:dalvic_lyrics_sharing_app/models/song.dart';
import 'package:equatable/equatable.dart';

abstract class SongState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialSongState extends SongState {
  final String userId;
  InitialSongState({this.userId});
}

class LoadingSongState extends SongState {}

class ErrorSongState extends SongState {
  final String message;
  ErrorSongState({this.message});
}

class SuccessSongState extends SongState {
  final List<Song> songs;
  final String message;
  SuccessSongState({this.songs, this.message});
}
