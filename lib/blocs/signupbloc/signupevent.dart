import 'package:dalvic_lyrics_sharing_app/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class SignUpEvent extends Equatable{
}

class SignUp extends SignUpEvent{
  final User user;
  SignUp({@required this.user}):assert(user!=null);
  @override
  List<Object> get props => [user];
}