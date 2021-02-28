import 'package:dalvic_lyrics_sharing_app/helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:dalvic_lyrics_sharing_app/models/Lyrics.dart';

class LyricsPage extends StatelessWidget {
  static const routeName = 'lyricsPage';

  final Lyrics lyrics;
  LyricsPage({@required this.lyrics}):assert(lyrics!=null);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Container(
            child: Container(
              child: Column(
                children: [

                  Text(
                    '${lyrics.musicName}',
                    style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal),
                  ),
                  Text(
                    '${lyrics.artistName}',
                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),
          actions: [IconButton(icon: Icon(Icons.favorite_border,color: Colors.white,), onPressed: null, padding: EdgeInsets.zero,)],
          elevation: 0.0,
        ),
        extendBodyBehindAppBar: true,



        body: SafeArea(
            child: SingleChildScrollView(
                child: Center(
                    child: Container(
                        margin: EdgeInsets.all(10),
                       padding: EdgeInsets.all(10),
                       child: Text('${lyrics.lyrics}',style: TextStyle(wordSpacing: 10),),
                       // width: MediaQuery.of(context).size.width * 0.8,
                        )
                )
            )
        )
    );
  }
}
