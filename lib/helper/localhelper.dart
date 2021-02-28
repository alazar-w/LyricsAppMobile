import 'dart:convert';

import 'package:dalvic_lyrics_sharing_app/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalHelper{
  final SharedPreferences sharedPreferences;
  LocalHelper({@required this.sharedPreferences}):assert(sharedPreferences!=null);

  User getUser(){
    return User.fromJsonComplete(jsonDecode(sharedPreferences.getString("user")));
  }

}