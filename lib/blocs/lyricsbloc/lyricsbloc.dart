import 'package:dalvic_lyrics_sharing_app/models/lyrics.dart';
import 'package:dalvic_lyrics_sharing_app/repository/lyricsrepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'lyrics.dart';

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
          List<Lyrics> requests = await lyricsRepository.getAllLyrics();
          yield FetchedAllSuccessState(requests: requests);
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
          Lyrics lyricsRequest = await lyricsRepository.createLyrics(request: event.lyricsRequest);
          print("did u get here 3");
          yield CreatedSuccessState(request: lyricsRequest);
        }catch(error, stacktrace){
          print(stacktrace);
          yield CreatingFailedState();
        }

      }
      else if(event is UpdateLyrics){
        try{
          yield UpdatingBusyState();
          Lyrics lyricsRequest = await lyricsRepository.updateLyrics(request: event.lyricsRequest);
          yield UpdatedSuccessState(request: lyricsRequest);
        }catch(error){
          print(error);
          yield UpdatingFailedState();
        }
      }
      else if(event is DeleteLyrics){
        try{
          await lyricsRepository.deleteLyrics(requestId: event.requestId);
          yield DeleteSuccessState();
        }catch(error){
          print(error);
          yield DeleteFailedState();
        }
      }
    }catch(error){
      print(error);
      yield FailedState();
    }
  }
}