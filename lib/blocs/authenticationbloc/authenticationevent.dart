import 'package:dalvic_lyrics_sharing_app/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

abstract class AuthenticationEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class InitEvent extends AuthenticationEvent{}

class SaveAuthenticationInfo extends AuthenticationEvent{
  final User user;
  SaveAuthenticationInfo({@required this.user}):assert(user!=null);

  @override
  List<Object> get props => [user];
}

class Logout extends AuthenticationEvent{}

class DeleteAccount extends AuthenticationEvent{
  final int userId;
  DeleteAccount({@required this.userId}):assert(userId!=null);

  @override
  List<Object> get props => [userId];
}