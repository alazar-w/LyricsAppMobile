import 'package:dalvic_lyrics_sharing_app/models/song.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class FavoriteEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AddToFavorite extends FavoriteEvent {
  Song song;
  final String user_id;

  AddToFavorite({this.song, this.user_id});
}

class RemoveFromFavorite extends FavoriteEvent {
  Song song;
  final String user_id;

  RemoveFromFavorite({this.song, this.user_id});
}

class GetFavoriteSongs extends FavoriteEvent {
  Song song;
  final String user_id;

  GetFavoriteSongs({this.song, this.user_id});
}
