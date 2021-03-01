import 'package:dalvic_lyrics_sharing_app/blocs/authenticationbloc/authenticationbloc.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/authenticationbloc/authenticationevent.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/lyricsbloc/lyricsb.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/userbloc/userbloc.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/userbloc/userevent.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/userbloc/userstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants.dart';

class ProfilePage extends StatelessWidget{
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        elevation: 0,
      ),
     body: BlocListener<UserBloc, UserState>(
       listener: (context, state){
         if(state is UserDeleteSuccess){
           BlocProvider.of<AuthenticationBloc>(context).add(Logout());
           Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
         }else if (state is UserDeleteFailed){
           _scaffoldkey.currentState.showSnackBar(SnackBar(content: Text('Failed Deleting account')));
         }
       },
       child: Padding(
         padding: EdgeInsets.all(20.0),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             TextButton(onPressed: (){}, child: Text('Favorites', style: TextStyle(color: Colors.black45),)),
             Divider(
               color: Colors.black12,
               height: 2,
             ),
             TextButton(onPressed: (){
               Navigator.of(context).pushNamed('/lyricsrequests');
             }, child: Text('My Requests', style: TextStyle(color: Colors.black45),)),
             Divider(
               color: Colors.black12,
               height: 2,
             ),
             TextButton(onPressed: (){
               BlocProvider.of<LyricsBloc>(context).add(GetMyLyrics());
               Navigator.of(context).pushNamed('/mylyrics');
             }, child: Text('My Lyrics', style: TextStyle(color: Colors.black45),)),
             Divider(
               color: Colors.black12,
               height: 2,
             ),
             TextButton(onPressed: (){
               BlocProvider.of<LyricsBloc>(context).add(GetMyLyrics());
               Navigator.of(context).pushNamed('/updateprofile');
             }, child: Text('Update Profile', style: TextStyle(color: Colors.black45),)),
             Divider(
               color: Colors.black12,
               height: 2,
             ),
             TextButton(onPressed: (){
               showDialog(
                   context: context,
                   builder: (context){
                     return AlertDialog(
                       title: Text('Delete Account', style: TextStyle(color: kPrimary),),
                       content: Text(
                           'Are you sure?'
                       ),
                       actions: [
                         TextButton(onPressed: (){
                           Navigator.of(context).pop();
                         }, child: Text('No')),
                         TextButton(onPressed: (){
                           BlocProvider.of<UserBloc>(context).add(DeleteUser());
                         }, child: Text('Yes'))
                       ],
                     );
                   }
               );
             }, child: Text('Delete Account', style: TextStyle(color: Colors.black45),)),
             Divider(
               color: Colors.black12,
               height: 2,
             ),

           ],
         ),
       ),
     ),
    );
  }
}