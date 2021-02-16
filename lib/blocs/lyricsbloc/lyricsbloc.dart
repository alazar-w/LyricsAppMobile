import 'package:dalvic_lyrics_sharing_app/models/lyrics.dart';
import 'package:dalvic_lyrics_sharing_app/repository/lyricsrepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'lyricsrequest.dart';

class LyricsRequestBloc extends Bloc<LyricsRequestEvent, LyricsRequestState>{
  final LyricsRepository lyricsRequestRepository;
  LyricsRequestBloc({@required this.lyricsRequestRepository}):assert(lyricsRequestRepository!=null),super(IdleState());

  @override
  Stream<LyricsRequestState> mapEventToState(LyricsRequestEvent event) async* {
    print("map event to state");
    // TODO: implement mapEventToState
    try{
      if(event is GetAllRequest){
        try{
          yield FetchingBusyState();
          print("getting data");
          List<Lyrics> requests = await lyricsRequestRepository.getAllLyrics();
          yield FetchedAllSuccessState(requests: requests);
        }catch(error){
          print(error);
          yield FetchingFailedState();
        }

      }
      else if(event is CreateRequest){
        try{
          yield CreatingBusyState();
          Lyrics lyricsRequest = await lyricsRequestRepository.createLyrics(request: event.lyricsRequest);
          yield CreatedSuccessState(request: lyricsRequest);
        }catch(error){
          print(error);
          yield CreatingFailedState();
        }

      }
      else if(event is UpdateRequest){
        try{
          yield UpdatingBusyState();
          Lyrics lyricsRequest = await lyricsRequestRepository.updateLyrics(request: event.lyricsRequest);
          yield UpdatedSuccessState(request: lyricsRequest);
        }catch(error){
          print(error);
          yield UpdatingFailedState();
        }
      }
      else if(event is DeleteRequest){
        try{
          await lyricsRequestRepository.deleteLyrics(requestId: event.requestId);
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