import 'package:dalvic_lyrics_sharing_app/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SignInState extends Equatable{

}
class SignInInitialState extends SignInState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class SignInBusyState extends SignInState{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class SignInSuccesState extends SignInState{
  final User user;
  SignInSuccesState({@required this.user}):assert(user!=null);
  @override
  // TODO: implement props
  List<Object> get props => [user];

}
class SignInFailedState extends SignInState{
  final String errorMessage;
  SignInFailedState({@required this.errorMessage}):assert(errorMessage!=null);
  @override
  // TODO: implement props
  List<Object> get props => [errorMessage];
}