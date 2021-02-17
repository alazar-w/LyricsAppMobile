import 'package:dalvic_lyrics_sharing_app/blocs/lyricsbloc/lyrics.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/signupbloc/signup.dart';
import 'package:dalvic_lyrics_sharing_app/constants.dart';
import 'package:dalvic_lyrics_sharing_app/data_provider/lyricsdataprovider.dart';
import 'package:dalvic_lyrics_sharing_app/data_provider/signupdataprovider.dart';
import 'package:dalvic_lyrics_sharing_app/repository/lyricsrepository.dart';
import 'package:dalvic_lyrics_sharing_app/screens/lyricsrequestspage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'screens/screens.dart';
import 'package:flutter/material.dart';

void main() {
  LyricsRepository _lyricsRepository = new LyricsRepository(dataProvider: new LyricsDataProvider(httpClient: http.Client()));
  SignUpRepository _signUpRepository = SignUpRepository(signUpDataProvider: new SignUpDataProvider());
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => SignUpBloc(signUpRepository: _signUpRepository)),
    BlocProvider(create: (context) => LyricsBloc(lyricsRepository: _lyricsRepository)..add(GetAllLyrics())),
  ],
  child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: kPrimary,
        title: 'Lyrics Sharing',
        routes: {
          '/': (context) => WelcomePage(),
          '/login': (context) => LoginPage(),
          '/signup': (context) => SignUpPage(),
          '/home': (context) => HomePage(),
          '/addlyrics': (context) => AddLyricsPage(),
          '/addrequest': (context) => AddRequestPage(),
          '/lyrics': (context) => LyricsPage(),
          '/profile': (context) => ProfilePage(),
          '/lyricsrequests': (context) => LyricsRequestsPage(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: kPrimary,
        ),);
  }
}
