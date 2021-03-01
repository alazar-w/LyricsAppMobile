import 'package:equatable/equatable.dart';

abstract class UserState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class IdleState extends UserState{}

class UserUpdatedFailed extends UserState{}
class UserUpdatedBusy extends UserState{}
class UserUpdatedSuccess extends UserState{}

class UserDeleteFailed extends UserState{}
class UserDeleteBusy extends UserState{}
class UserDeleteSuccess extends UserState{}