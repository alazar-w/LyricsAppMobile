import 'package:dalvic_lyrics_sharing_app/models/lyricsrequest.dart';
import 'package:dalvic_lyrics_sharing_app/repository/lyricsrequestrepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/foundation.dart';
import 'lyricsrequest.dart';

class LyricsRequestBloc extends Bloc<LyricsRequestEvent, LyricsRequestState>{
  final LyricsRequestRepository lyricsRequestRepository;
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
          List<LyricsRequest> requests = await lyricsRequestRepository.getAllRequests();
          yield FetchedAllSuccessState(requests: requests);
        }catch(error){
          print(error);
          yield FetchingFailedState();
        }

      }
      else if(event is CreateRequest){
        try{
          yield CreatingBusyState();
          LyricsRequest lyricsRequest = await lyricsRequestRepository.createRequest(request: event.lyricsRequest);
          yield CreatedSuccessState(request: lyricsRequest);
        }catch(error){
          print(error);
          yield CreatingFailedState();
        }

      }
      else if(event is UpdateRequest){
        try{
          yield UpdatingBusyState();
          LyricsRequest lyricsRequest = await lyricsRequestRepository.updateRequest(request: event.lyricsRequest);
          yield UpdatedSuccessState(request: lyricsRequest);
        }catch(error){
          print(error);
          yield UpdatingFailedState();
        }
      }
      else if(event is DeleteRequest){
        try{
          await lyricsRequestRepository.deleteRequest(requestId: event.requestId);
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