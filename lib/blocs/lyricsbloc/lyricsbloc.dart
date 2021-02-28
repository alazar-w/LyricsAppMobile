import 'package:dalvic_lyrics_sharing_app/blocs/lyricsbloc/lyricsEvent.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/lyricsbloc/lyricsstate.dart';
import 'package:dalvic_lyrics_sharing_app/models/Lyrics.dart';
import 'package:dalvic_lyrics_sharing_app/repository/lyricsRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LyricsBloc extends Bloc<LyricsEvents, LyricsState> {
  LyricsRepository lyricsRepository;
  LyricsBloc({@required this.lyricsRepository})
      : assert(lyricsRepository != null),
        super(LyricsIdleState());

  @override
  Stream<LyricsState> mapEventToState(LyricsEvents event) async* {
    // TODO: implement mapEventToState
    try {
      if (event is CreateLyricsEvent) {
        yield LyricsBusyState();
        await lyricsRepository.CreateLyrics(event.lyrics);
        yield LyricsCreateSuccessState();
      } else if (event is GetAllLyrics) {
        List<Lyrics> lyrics = await lyricsRepository.GetLyrics();
        print(lyrics);
        yield LyricsSuccesState(lyrics);
      }
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
      yield LyricsFailedState(errorMessage: 'Lyrics Creation Failed!');
    }
  }
}
