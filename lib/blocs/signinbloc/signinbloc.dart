import 'package:dalvic_lyrics_sharing_app/blocs/signinbloc/signinevent.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/signupbloc/signupstate.dart';
import 'package:dalvic_lyrics_sharing_app/repository/signinrepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'signinstate.dart';

class SignInBloc extends Bloc<SignInEvent,SignInState>{
  final SignInRepository signInRepository;
  SignInBloc({@required this.signInRepository}):assert(signInRepository!=null), super(SignInInitialState());

  @override
  Stream<SignInState> mapEventToState(SignInEvent event) async*{
    // TODO: implement mapEventToState
    yield SignInBusyState();
    try{
      if(event is SignIn){
        yield SignInSuccesState(user: await signInRepository.signin(event.user));
      }
    }catch(error){
      yield SignInFailedState(errorMessage: "something went wrong!");
    }
  }}