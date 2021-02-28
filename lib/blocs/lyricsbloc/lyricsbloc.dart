import 'package:dalvic_lyrics_sharing_app/models/lyrics.dart';
import 'package:dalvic_lyrics_sharing_app/repository/lyricsrepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';

import 'lyricsevent.dart';
import 'lyricsstate.dart';

class LyricsBloc extends Bloc<LyricsEvent, LyricsState>{
  final LyricsRepository lyricsRepository;
  LyricsBloc({@required this.lyricsRepository}):assert(lyricsRepository!=null),super(IdleState());

  //async* represent stream,we use yield with it as we have many stream of data's to return
  @override
  Stream<LyricsState> mapEventToState(LyricsEvent event) async* {
    print("map event to state");
    // TODO: implement mapEventToState
    try{
      if(event is GetAllLyrics){
        try{
          yield FetchingBusyState();
          print("getting data");
          List<Lyrics> lyricss = await lyricsRepository.getAllLyrics();
          yield FetchedAllSuccessState(lyricss: lyricss);
        }catch(error){
          print(error);
          yield FetchingFailedState();
        }

      }
      else if(event is CreateLyrics){
        try{
          print("did u get here");
          yield CreatingBusyState();
          print("did u get here 2");
          Lyrics lyricsRequest = await lyricsRepository.createLyrics(lyrics: event.lyrics);
          print("did u get here 3");
          yield CreatedSuccessState(lyrics: lyricsRequest);
        }catch(error, stacktrace){
          print(stacktrace);
          yield CreatingFailedState();
        }

      }
      else if(event is UpdateLyrics){
        try{
          yield UpdatingBusyState();
          Lyrics lyricsRequest = await lyricsRepository.updateLyrics(lyrics: event.lyrics);
          yield UpdatedSuccessState(lyrics: lyricsRequest);
        }catch(error){
          print(error);
          yield UpdatingFailedState();
        }
      }
      else if(event is DeleteLyrics){
        try{
          await lyricsRepository.deleteLyrics(lyricsId: event.lyricsId);
          yield DeleteSuccessState();
        }catch(error){
          print(error);
          yield DeleteFailedState();
        }
      }
      else if(event is DeleteMyLyrics){
        try{
          await lyricsRepository.deleteLyrics(lyricsId: event.lyricsId);
          yield DeleteMyLyricsSuccesState();
        }catch(error){
          print(error);
          yield DeleteMyLyricsFailedState();
        }
      }
      else if(event is UpdateMyLyrics) {
        try {
          yield UpdateMyLyricsBusyState();
          Lyrics lyrics = await lyricsRepository.updateMyLyrics(
              lyrics: event.lyrics);
          yield UpdateMyLyricsSuccessState(lyrics: lyrics);
        } catch (error) {
          print(error);
          yield UpdateMyLyricsFailedState();
        }
      }
      else if(event is GetMyLyrics){
        try{
          yield GetMyLyricsBusyState();
          var lyricss = await lyricsRepository.getMyLyrics();
          yield GetMyLyricsSuccessState(lyricss: lyricss);
        }catch(error){
          print(error);
          yield GetMyLyricsFailedState();
        }
      }
    }catch(error){
      print(error);
      yield FailedState();
    }

  }
}