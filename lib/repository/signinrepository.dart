import 'package:dalvic_lyrics_sharing_app/data_provider/signindataprovider.dart';
import 'package:dalvic_lyrics_sharing_app/models/user.dart';
import 'package:flutter/foundation.dart';

class SignInRepository{
  SignInDataProvider signInDataProvider;
  SignInRepository({@required this.signInDataProvider}):assert(signInDataProvider!=null);
  Future<User> signin(User user) async{
    return await signInDataProvider.SignIn(user);
  }
}