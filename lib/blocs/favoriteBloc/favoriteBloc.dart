import 'package:dalvic_lyrics_sharing_app/models/favorite.dart';
import 'package:dalvic_lyrics_sharing_app/repository/favoriteRepository.dart';
import 'package:dalvic_lyrics_sharing_app/repository/songRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'favoriteEvent.dart';
import 'favoriteState.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc()
      : super(InitialFavoriteState(userId: '602b918881836824315844ab'));

  @override
  Stream<FavoriteState> mapEventToState(FavoriteEvent event) async* {
    if (event is AddToFavorite) {
      yield LoadingFavoriteState();
      try {
        Favorite fav = Favorite(song_id: event.song.id, user_id: event.user_id);
        var res = await FavoriteRepository().addToFavorites(fav);
        // print(res);
        if (res != null) {
          yield SuccessFavoriteState(
              message: "Song added to Favorites!", favorite: fav);
        }
      } catch (e) {
        print(e);
        // yield ErrorFavoriteState(message: e);
      }
    } else if (event is RemoveFromFavorite) {
      yield LoadingFavoriteState();
      try {
        Favorite fav = Favorite(song_id: event.song.id, user_id: event.user_id);
        var res = await FavoriteRepository().removeFromFavorites(fav);
        // print(res);
        if (res != null) {
          yield DeleteFavoriteState(
              message: "Song removed from Favorites", favorite: fav);
        }
      } catch (e) {
        print(e);
        // yield ErrorFavoriteState(message: e);
      }
    }
  }
}
