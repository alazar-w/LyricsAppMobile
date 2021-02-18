import 'package:dalvic_lyrics_sharing_app/models/favorite.dart';
import 'package:dalvic_lyrics_sharing_app/models/song.dart';
import 'package:equatable/equatable.dart';

abstract class FavoriteState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialFavoriteState extends FavoriteState {
  final String userId;
  InitialFavoriteState({this.userId});
}

class LoadingFavoriteState extends FavoriteState {}

class ErrorFavoriteState extends FavoriteState {
  final String message;
  ErrorFavoriteState({this.message});
}

class SuccessFavoriteState extends FavoriteState {
  final Favorite favorite;
  final String message;
  SuccessFavoriteState({this.favorite, this.message});
}

class DeleteFavoriteState extends FavoriteState {
  final Favorite favorite;
  final String message;
  DeleteFavoriteState({this.favorite, this.message});
}
