import 'package:dalvic_lyrics_sharing_app/models/song.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class SongEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CreateSong extends SongEvent {
  Song song;

  CreateSong({this.song});
}

class FetchSongs extends SongEvent {
  FetchSongs();
}
