import 'dart:ffi';
import 'package:dalvic_lyrics_sharing_app/data_provider/userdataprovider.dart';
import 'package:dalvic_lyrics_sharing_app/models/user.dart';
import 'package:flutter/foundation.dart';

class UserRepository{
  UserDataProvider userDataProvider;
  UserRepository({@required this.userDataProvider}):assert(userDataProvider!=null);

  Future<Void> updateUser({User user}) async {
    return await userDataProvider.updateUser(user: user);
  }

  Future<Void> deleteUser() async {
    return await userDataProvider.deleteUser();
  }
}