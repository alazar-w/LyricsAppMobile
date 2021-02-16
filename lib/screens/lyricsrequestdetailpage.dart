import 'package:dalvic_lyrics_sharing_app/models/lyrics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LyricsRequestDetailPage extends StatelessWidget{
  final Lyrics request;
  LyricsRequestDetailPage({@required this.request}):assert(request!=null);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Lyrics request detail'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Artist: ${request.artistName}'),
            Text('Music: ${request.musicName}'),
            Text('URL: ${request.url}'),
          ],
        ),
      )
    );
  }
}