import 'package:dalvic_lyrics_sharing_app/helper/constants.dart';
import 'package:flutter/material.dart';

class LyricsPage extends StatelessWidget {
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
                    'Malan Jirra',
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    'Hacallu hundessa',
                    style: TextStyle(color: kPrimary,fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          actions: [IconButton(icon: Icon(Icons.favorite_border,color: Colors.black,), onPressed: null, padding: EdgeInsets.zero,)],
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        extendBodyBehindAppBar: true,



        body: SafeArea(
            child: SingleChildScrollView(
                child: Center(
                    child: Container(
                        margin: EdgeInsets.all(10),
                       padding: EdgeInsets.all(10),
                       child: Text('lorem jgjsokpokvlkmsmlkmvlakmlkm',style: TextStyle(wordSpacing: 10),),
                       // width: MediaQuery.of(context).size.width * 0.8,
                        )
                )
            )
        )
    );
  }
}
