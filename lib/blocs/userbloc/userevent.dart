import 'package:dalvic_lyrics_sharing_app/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class UserEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class UpdateUser extends UserEvent{
  final User user;
  UpdateUser({@required this.user}):assert(user!=null);

  @override
  // TODO: implement props
  List<Object> get props => [user];
}

class DeleteUser extends UserEvent{}