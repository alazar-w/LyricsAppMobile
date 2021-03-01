import 'dart:convert';

import 'package:dalvic_lyrics_sharing_app/blocs/authenticationbloc/authenticationevent.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/authenticationbloc/authenticationstate.dart';
import 'package:dalvic_lyrics_sharing_app/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState>{
  final SharedPreferences sharedPreferences;
  AuthenticationBloc({@required this.sharedPreferences}):super(InitState());

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async*{
    // TODO: implement mapEventToState
    try{
      if(event is InitEvent){
        String rawUser = sharedPreferences.getString("user");
        print("rawUser: $rawUser");
        if(rawUser==null){
          yield Unauthenticated();
        }else{
          print("authenticated");
          yield Authenticated(user: User.fromJsonComplete(jsonDecode(rawUser)));
        }
      }
      else if(event is SaveAuthenticationInfo){
        await sharedPreferences.setString("user", jsonEncode(event.user.toJson()));
        yield Authenticated(user: event.user);
      }
      else if(event is Logout){
        await sharedPreferences.remove("user");
        yield Unauthenticated();
      }
    }catch(error){
      yield Unauthenticated();
    }
  }
}

