import 'package:dalvic_lyrics_sharing_app/blocs/signupbloc/signup.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState>{
  final SignUpRepository signUpRepository;
  SignUpBloc({@required this.signUpRepository}):assert(signUpRepository!=null),super(InitialState());

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    yield BusyState();
    try{
      if(event is SignUp){
        yield SuccessState(user: await signUpRepository.signUp(event.user));
      }
    }catch(error){
      yield FailedState(errorMessage:"Something went wrong");
    }
  }
}