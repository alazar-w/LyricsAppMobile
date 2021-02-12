import 'package:dalvic_lyrics_sharing_app/constants.dart';
import 'package:dalvic_lyrics_sharing_app/screens/homepage.dart';
import 'package:dalvic_lyrics_sharing_app/screens/signuppage.dart';
import 'package:flutter/material.dart';

import 'loginpage.dart';

class WelcomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      body:
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [

            Image(
              image: AssetImage("assets/images/welcome.png"),
            ),
            Column(
              children: [
                Text("Find Lyrics For ",
                  style: TextStyle(
                  fontSize: 32,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),),
                Text("Any Song ",
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Request, Submit and Find Lyrics",
                    style: TextStyle(

                      color: Colors.black54,

                    ),),
                ),
              ],
            ),



            Row(
              children: [
                Expanded(
                  child: OutlineButton(
                      borderSide: BorderSide(
                        color: kPrimary
                      ),
                      onPressed:(){
                        Navigator.of(context).pushNamed('/signup');

                      },

                      child: Text("SIGNUP",
                          style: TextStyle(
                            color: kPrimary
                          ))
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: FlatButton(
                      onPressed:(){
                        Navigator.of(context).pushNamed('/login');

                      },
                      color: kPrimary,
                      child: Text("LOGIN",
                        style: TextStyle(
                          color: Colors.white
                         ),
                      )
                  ),
                ),

              ],
            ),
            Row( mainAxisAlignment:  MainAxisAlignment.center,
              children: [
                Text("continue as ",

                style: TextStyle(
                color: Colors.black54,
            ),),
                GestureDetector(onTap: (){
                  Navigator.of(context).pushNamed('/home');
                },
                  child: Text("guest",
                    style: TextStyle(
                      color: kPrimary,
                    ),),
                )
              ],
            )
            ,

          ],
        ),
      ),
    ));
  }
}