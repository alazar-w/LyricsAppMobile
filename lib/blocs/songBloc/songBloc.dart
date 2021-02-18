import 'package:dalvic_lyrics_sharing_app/blocs/songBloc/song.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/songBloc/songEvent.dart';
import 'package:dalvic_lyrics_sharing_app/repository/songRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SongBloc extends Bloc<SongEvent, SongState> {
  SongBloc() : super(InitialSongState(userId: '124556asdf-234223f'));

  @override
  Stream<SongState> mapEventToState(SongEvent event) async* {
    if (event is CreateSong) {
      yield LoadingSongState();
      try {
        var res = await SongRepository().createSong(event.song);
        if (res != null) {
          yield SuccessSongState(message: "Song submitted!");
        }
      } catch (e) {
        yield ErrorSongState(message: e);
      }
    }
    if (event is FetchSongs) {
      yield LoadingSongState();
      var res = await SongRepository().fetchSongs("602b918881836824315844ab");
      // print(res);
      yield SuccessSongState(message: "Songs fetched", songs: res);
      try {} catch (e) {}
    }
  }
}
