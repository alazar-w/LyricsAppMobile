import 'package:dalvic_lyrics_sharing_app/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class AuthenticationState extends Equatable{
  @override
  List<Object> get props => [];
}

class Authenticated extends AuthenticationState{
  final User user;
  Authenticated({@required this.user}):assert(user!=null);

  @override
  List<Object> get props => [user];
}

class InitState extends AuthenticationState{}

class Unauthenticated extends AuthenticationState{}