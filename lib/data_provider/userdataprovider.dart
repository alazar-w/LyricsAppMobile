import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:dalvic_lyrics_sharing_app/data_provider/BaseDataProvider.dart';
import 'package:dalvic_lyrics_sharing_app/helper/localhelper.dart';
import 'package:dalvic_lyrics_sharing_app/models/user.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class UserDataProvider extends BaseDataProvider{
  http.Client httpClient;
  LocalHelper localHelper;
  
  UserDataProvider({@required this.httpClient, @required this.localHelper}):assert(httpClient!=null && localHelper!=null);
  
  Future<Void> updateUser({User user}) async {
    // print('user name: ${user.name}');
    // var response = await http.put('$baseUrl/user/${user.id}',
    //   headers: {
    //     HttpHeaders.authorizationHeader: "Bearer ${localHelper.getUser().token}",
    //   },
    //   body: {
    //     'name': user.name,
    //     'email': user.email,
    //     'password': user.password,
    //     '_method': "PUT"
    //   }
    // );
    var response = await http.put('$baseUrl/user/${user.id}', headers: {HttpHeaders.authorizationHeader: "Bearer ${localHelper.getUser().token}"},
    body: {
      "name": user.name,
      "email": user.email,
    }
    );
    print(response.body);
    if (response.statusCode != 200){
      throw Exception('Error updating user');
    }
  }

  Future<Void> deleteUser() async {
    var response = await http.delete('$baseUrl/user/${localHelper.getUser().id}',
      headers: {
        HttpHeaders.authorizationHeader: "Bearer ${localHelper.getUser().token}"
      },
    );

    if(response.statusCode != 200){
      throw Exception("Delete user failed");
    }
  }
}