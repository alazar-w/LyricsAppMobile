import 'package:dalvic_lyrics_sharing_app/blocs/lyricsbloc/lyricsb.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        elevation: 0,
      ),
     body: Padding(
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

         ],
       ),
     ),
    );
  }
}