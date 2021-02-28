import 'package:dalvic_lyrics_sharing_app/models/Lyrics.dart';
import 'package:dalvic_lyrics_sharing_app/repository/homepagerepository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'homepagestate.dart';


enum HomepageEvent {
  GetLyrics
}

class HomePageBloc extends Bloc<HomepageEvent, HomepageState>{
  HomepageRepository homePageRepository;
  HomePageBloc({@required this.homePageRepository}):super(HomepageBusyState());

  @override
  Stream<HomepageState> mapEventToState(HomepageEvent event) async* {
    // TODO: implement mapEventToState
    try{
      if(event == HomepageEvent.GetLyrics){
        yield HomepageBusyState();
        List<Lyrics> lyrics = await homePageRepository.getAllLyrics(page: 1);
        yield HomepageSuccessState(lyrics: lyrics);
      }
    }catch(error, stacktrace){
      print(stacktrace);
      yield HomepageFailureState();
    }
  }
}