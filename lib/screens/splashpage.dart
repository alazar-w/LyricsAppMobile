import 'package:dalvic_lyrics_sharing_app/blocs/authenticationbloc/authenticationbloc.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/authenticationbloc/authenticationstate.dart';
import 'package:dalvic_lyrics_sharing_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state){
        print(state);
        Future.delayed(Duration(seconds: 5), (){
            if(state is Authenticated){
                Navigator.pushNamedAndRemoveUntil(context, '/home', (Route<dynamic> route) => false);
          }else{
            Navigator.pushNamedAndRemoveUntil(context, '/', (Route<dynamic> route) => false);
            }
        });
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: SpinKitCubeGrid(
              color: kPrimary,
              size: 40,
            ),
        ),
      ),
    );
  }
}