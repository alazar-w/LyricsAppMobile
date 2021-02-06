import 'package:dalvic_lyrics_sharing_app/constants.dart';
import 'package:dalvic_lyrics_sharing_app/screens/addrequestpage.dart';
import 'package:dalvic_lyrics_sharing_app/screens/splashpage.dart';
import 'package:dalvic_lyrics_sharing_app/screens/welcomepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimary
      ),
      home: AddRequestPage()

    );
  }
}
