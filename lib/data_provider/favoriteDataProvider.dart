import 'dart:convert';

import 'package:dalvic_lyrics_sharing_app/data_provider/BaseDataProvider.dart';
import 'package:dalvic_lyrics_sharing_app/models/favorite.dart';
import 'package:http/http.dart' as http;

class FavoriteDataProvider extends BaseDataProvider {
  Future<Favorite> addToFavoritesApi(String song_id, String user_id) async {
    var res;
    try {
      res = await http.post(
        '$baseUrl/favorite',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{'song_id': song_id, 'user_id': user_id}),
      );
    } catch (e) {
      print(e);
    }
    return Favorite.fromJson(jsonDecode(res.body));
  }

  Future<Favorite> removeFromFavoritesApi(
      String song_id, String user_id) async {
    var res;
    try {
      res = await http.delete(
        '$baseUrl/favorite/$song_id/$user_id',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
    } catch (e) {
      print(e);
    }
    return Favorite.fromJson(jsonDecode(res.body));
  }

  Future<Favorite> fetchFavoritesApi(String user_id) async {
    var res = await http.get(
      '$baseUrl/$user_id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return Favorite.fromJson(jsonDecode(res.body));
  }
}
