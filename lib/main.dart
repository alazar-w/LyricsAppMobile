import 'package:dalvic_lyrics_sharing_app/blocs/authenticationbloc/authenticationbloc.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/lyricsbloc/lyricsbloc.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/authenticationbloc/authenticationevent.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/authenticationbloc/authenticationstate.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/lyricsrequestbloc/lyricsrequest.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/signinbloc/signinbloc.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/signupbloc/signup.dart';
import 'package:dalvic_lyrics_sharing_app/constants.dart';
import 'package:dalvic_lyrics_sharing_app/data_provider/lyricsrequestdataprovider.dart';
import 'package:dalvic_lyrics_sharing_app/data_provider/data_provider.dart';
import 'package:dalvic_lyrics_sharing_app/repository/lyricsrequestrepository.dart';
import 'package:dalvic_lyrics_sharing_app/screens/lyricsrequestspage.dart';
import 'package:dalvic_lyrics_sharing_app/repository/lyricsRepository.dart';
import 'package:dalvic_lyrics_sharing_app/repository/signinrepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LyricsRequestRepository _lyricsRequestRepository =
      new LyricsRequestRepository(
          dataProvider:
              new LyricsRequestDataProvider(httpClient: http.Client()));
  SignUpRepository _signUpRepository =
      SignUpRepository(signUpDataProvider: new SignUpDataProvider());
  SignInRepository _signInRepository =
      SignInRepository(signInDataProvider: new SignInDataProvider());
  final LyricsRepository lyricsRepository = LyricsRepository(
    dataProvider: LyricsDataProvider(
      httpClient: http.Client(),
    ),
  );
  SharedPreferences _sharedPreferences = await SharedPreferences.getInstance();
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
        create: (context) => SignUpBloc(signUpRepository: _signUpRepository)),
    BlocProvider(
        create: (context) =>
            LyricsRequestBloc(lyricsRequestRepository: _lyricsRequestRepository)
              ..add(GetAllRequest())),
    BlocProvider(
        create: (context) =>
            AuthenticationBloc(sharedPreferences: _sharedPreferences)
              ..add(InitEvent())),
    BlocProvider(
        create: (context) => LyricsBloc(lyricsRepository: lyricsRepository)),
    BlocProvider(
        create: (context) => SignInBloc(signInRepository: _signInRepository)),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: kPrimary,
      title: 'Lyrics Sharing',
      initialRoute: '/splash',
      routes: {
        '/': (context) => WelcomePage(),
        '/splash': (context) => SplashPage(),
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
      ),
    );
  }
}
