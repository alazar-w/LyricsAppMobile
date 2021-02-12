import 'package:dalvic_lyrics_sharing_app/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SignUpState extends Equatable{}

class InitialState extends SignUpState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class BusyState extends SignUpState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class SuccessState extends SignUpState{
  final User user;
  SuccessState({@required this.user}):assert(user!=null);

  @override
  // TODO: implement props
  List<Object> get props => [user];
}

class FailedState extends SignUpState{
  final String errorMessage;
  FailedState({@required this.errorMessage}):assert(errorMessage!=null);

  @override
  // TODO: implement props
  List<Object> get props => [errorMessage];
}