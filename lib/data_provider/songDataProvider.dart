import 'dart:convert';

import 'package:dalvic_lyrics_sharing_app/data_provider/BaseDataProvider.dart';
import 'package:dalvic_lyrics_sharing_app/models/song.dart';
import 'package:http/http.dart' as http;

class SongDataProvider extends BaseDataProvider {
  Future<Song> createSongApi(Song song) async {
    var res = await http.post(
      Uri.https('$baseUrl', '/courses'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': song.music_name,
      }),
    );
    return Song.fromJson(jsonDecode(res.body));
  }

  Future<List<Song>> fetchSongsApi(String user_id) async {
    var res = await http.get(
      '$baseUrl/songs/$user_id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    var tempsongs = jsonDecode(res.body);
    List<Song> songs = [];
    for (var i = 0; i < tempsongs.length; i++) {
      songs.add(Song.fromJson(tempsongs[i]));
    }

    return songs;
  }
}
