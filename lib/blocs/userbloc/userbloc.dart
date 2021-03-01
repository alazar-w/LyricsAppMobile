import 'package:dalvic_lyrics_sharing_app/blocs/lyricsbloc/lyricsb.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/userbloc/userevent.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/userbloc/userstate.dart';
import 'package:dalvic_lyrics_sharing_app/helper/localhelper.dart';
import 'package:dalvic_lyrics_sharing_app/repository/userrepository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState>{
  UserRepository userRepository;

  UserBloc({@required this.userRepository}):assert(userRepository!=null),super(IdleState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    // TODO: implement mapEventToState
    if(event is UpdateUser){
      try{
        yield UserUpdatedBusy();
        await userRepository.updateUser(user: event.user);
        yield UserUpdatedSuccess();
      }catch(error, stacktrace){
        print(stacktrace);
        yield UserUpdatedFailed();
      }
    }
    if(event is DeleteUser){
      try{
        yield UserDeleteBusy();
        await userRepository.deleteUser();
        yield UserDeleteSuccess();
      }catch(error){
        yield UserDeleteFailed();
      }
    }
  }
}