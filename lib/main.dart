import 'package:dalvic_lyrics_sharing_app/blocs/signupbloc/signup.dart';
import 'package:dalvic_lyrics_sharing_app/constants.dart';
import 'package:dalvic_lyrics_sharing_app/data_provider/signupdataprovider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/screens.dart';
import 'package:flutter/material.dart';

void main() {

  SignUpRepository _signUpRepository = SignUpRepository(signUpDataProvider: new SignUpDataProvider());
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => SignUpBloc(signUpRepository: _signUpRepository))
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
