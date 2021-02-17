import 'dart:convert';

import 'package:dalvic_lyrics_sharing_app/data_provider/BaseDataProvider.dart';
import 'package:dalvic_lyrics_sharing_app/models/user.dart';
import 'package:http/http.dart' as http;

class SignInDataProvider extends BaseDataProvider{
  Future<User> SignIn(User user) async{
    print(user.email);
    var response = await http.post('$baseUrl/login',body: {
      'email':user.email,
      'password':user.password,
    });
    //print(response.body);
    if(response.statusCode==200){
      var rawResponse = jsonDecode(response.body)['response'];
      User user = User.fromJson(rawResponse['user']);
      var token = rawResponse['token'];
      user.token = token;
      return user;
    }
    else{

      throw Exception('SomeThing Went Wrong!');
    }

  }
}