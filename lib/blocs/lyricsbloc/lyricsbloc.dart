import 'package:dalvic_lyrics_sharing_app/blocs/lyricsbloc/lyricsEvent.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/lyricsbloc/lyricsstate.dart';
import 'package:dalvic_lyrics_sharing_app/repository/lyricsRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LyricsBloc extends Bloc<LyricsEvents,LyricsState>{
  LyricsRepository lyricsRepository;
  LyricsBloc({@required this.lyricsRepository}):assert(lyricsRepository!=null),super(LyricsIdleState());

  @override
  Stream<LyricsState> mapEventToState(LyricsEvents event) async*{
    // TODO: implement mapEventToState
    if(event is CreateLyricsEvent){
      yield LyricsBusyState();
      try{
          await lyricsRepository.CreateLyrics(event.lyrics);
          final lyricses = await lyricsRepository.GetLyrics();
          yield LyricsSuccesState(lyricses);
      }catch(error, stacktrace){
        print(stacktrace);
        yield LyricsFailedState(errorMessage: 'Lyrics Creation Failed!');
      }
    }
  }

}