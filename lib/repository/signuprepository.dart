import 'package:dalvic_lyrics_sharing_app/data_provider/signupdataprovider.dart';
import 'package:dalvic_lyrics_sharing_app/models/user.dart';
import 'package:meta/meta.dart';

class SignUpRepository{
  SignUpDataProvider signUpDataProvider;
  SignUpRepository({@required this.signUpDataProvider}):assert(signUpDataProvider!=null);

  Future<User> signUp(User user)async{
    return await signUpDataProvider.signUp(user);
  }
}