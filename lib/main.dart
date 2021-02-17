import 'package:dalvic_lyrics_sharing_app/blocs/lyricsbloc/lyricsbloc.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/signinbloc/signinbloc.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/signupbloc/signup.dart';
import 'package:dalvic_lyrics_sharing_app/constants.dart';
import 'package:dalvic_lyrics_sharing_app/data_provider/LyricsDataProvider.dart';
import 'package:dalvic_lyrics_sharing_app/data_provider/signindataprovider.dart';
import 'package:dalvic_lyrics_sharing_app/data_provider/signupdataprovider.dart';
import 'package:dalvic_lyrics_sharing_app/repository/lyricsRepository.dart';
import 'package:dalvic_lyrics_sharing_app/repository/signinrepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {

  SignUpRepository _signUpRepository = SignUpRepository(signUpDataProvider: new SignUpDataProvider());
  SignInRepository _signInRepository = SignInRepository(signInDataProvider: new SignInDataProvider());
  final LyricsRepository lyricsRepository = LyricsRepository(
    dataProvider: LyricsDataProvider(
      httpClient: http.Client(),
    ),
  );
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => SignUpBloc(signUpRepository: _signUpRepository)),
    BlocProvider(create: (context) => SignInBloc(signInRepository: _signInRepository)),
    BlocProvider(create: (context) => LyricsBloc(lyricsRepository:lyricsRepository)),
  ],
  child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: Theme.of(context).primaryColor,
        title: 'Flutter Demo',
        routes: {
          '/': (context) => WelcomePage(),
          '/login': (context) => LoginPage(),
          '/signup': (context) => SignUpPage(),
          '/home': (context) => HomePage(),
          '/addlyrics': (context) => AddLyricsPage(),
          '/addrequest': (context) => AddRequestPage(),
          '/lyrics': (context) => LyricsPage(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: kPrimary,
        ),);
  }
}
