import 'package:dalvic_lyrics_sharing_app/data_provider/favoriteDataProvider.dart';
import 'package:dalvic_lyrics_sharing_app/models/favorite.dart';

class FavoriteRepository {
  Future<Favorite> addToFavorites(Favorite favorite) async {
    return await FavoriteDataProvider()
        .addToFavoritesApi(favorite.song_id, favorite.user_id);
  }

  Future<Favorite> removeFromFavorites(Favorite favorite) async {
    return await FavoriteDataProvider()
        .removeFromFavoritesApi(favorite.song_id, favorite.user_id);
  }

  Future<Favorite> fetchFavorites(String user_id) async {
    return await FavoriteDataProvider().fetchFavoritesApi(user_id);
  }
}
