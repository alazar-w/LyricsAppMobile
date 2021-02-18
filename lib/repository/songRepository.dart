import 'package:dalvic_lyrics_sharing_app/data_provider/songDataProvider.dart';
import 'package:dalvic_lyrics_sharing_app/models/song.dart';

class SongRepository {
  Future<Song> createSong(Song song) async {
    return await SongDataProvider().createSongApi(song);
  }

  Future<List<Song>> fetchSongs(String user_id) async {
    return await SongDataProvider().fetchSongsApi(user_id);
  }
}
