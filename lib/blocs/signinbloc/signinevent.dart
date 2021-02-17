import 'package:dalvic_lyrics_sharing_app/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class SignInEvent extends Equatable{
  
}
class SignIn extends SignInEvent{
  User user;
  SignIn({@required this.user}):assert(user!=null);
  @override
  // TODO: implement props
  List<Object> get props => [user];

}