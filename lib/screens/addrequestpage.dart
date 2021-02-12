import 'package:flutter/material.dart';

import '../constants.dart';
import 'homepage.dart';
import 'lyricspage.dart';

class AddRequestPage extends StatelessWidget{
  final formkey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(child:Scaffold(
      backgroundColor: Colors.white,
      body:
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(onTap: (){
                      Navigator.of(context).pop();
                    }
                      ,
                      child: Icon(
                        Icons.arrow_back
                      ),
                    ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 65),
                        child: Text("Add Request",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        )),
                      ),


                  ],
                )
                ,
                Form(
                  key: formkey,
                  child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical:50.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Music Name",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  fillColor: kPrimaryLight,
                                  filled: true,
                                  enabledBorder:OutlineInputBorder(
                                      borderSide:BorderSide(
                                          color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: kPrimary)
                                  ),

                                ),

                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Artist Name",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,),),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                // The validator receives the text that the user has entered.
                                decoration: InputDecoration(
                                  fillColor: kPrimaryLight,
                                  filled: true,
                                  enabledBorder:OutlineInputBorder(
                                      borderSide:BorderSide(
                                          color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: kPrimary)
                                  ),

                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text("URL",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,),),
                                  Text("(",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,),),
                                  Text("optional",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                      fontSize: 15,),),
                                  Text(")",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,),),
                                ],
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  fillColor: kPrimaryLight,
                                  filled: true,
                                  enabledBorder:OutlineInputBorder(
                                      borderSide:BorderSide(
                                          color: Colors.white)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: kPrimary)
                                  ),

                                ),
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                              ),
                            ),
                  ],
                )),
                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Center(
                             child: FlatButton(

                                onPressed:(){
                                  if(formkey.currentState.validate())
                                  Navigator.of(context).pushNamed('/lyrics');

                                },
                                 minWidth: double.infinity,
                                 height: 50,
                                color: kPrimary,
                                child: Text("Add Request",
                                  style: TextStyle(
                                      color: Colors.white
                                  ),
                                )
                        ),
                           ),
                         ),

                    ],
                  ),
                )
              ],
            ),
          ),
        ),


    ));
  }
}