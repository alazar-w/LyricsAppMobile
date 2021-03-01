import 'package:dalvic_lyrics_sharing_app/models/Lyrics.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class LyricsListItem extends StatelessWidget{
  final Lyrics lyrics;
  LyricsListItem({@required this.lyrics}):assert(lyrics!=null);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: (){
        print('clicked');
        Navigator.pushNamed(context, 'lyricsPage', arguments: lyrics);
      },
      child: Container(
        padding: const EdgeInsets.all( 8.0),
        margin: EdgeInsets.only(bottom: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          // border: Border.all(color: Color(0xFFDFDFDF), width: 1.0)
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: kPrimary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.music_note_rounded,
                color: Colors.white,
                size: 25.0
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${lyrics.musicName}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                    Text(
                      '${lyrics.artistName}',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
            // IconButton(
            //     icon: Icon(
            //       Icons.favorite_border_sharp,
            //       color: Colors.black38,
            //     ),
            //     onPressed: null)
          ],
        ),
      ),
    );
  }
}