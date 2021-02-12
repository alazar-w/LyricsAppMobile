
import 'package:dalvic_lyrics_sharing_app/helper/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String pathName = '/home';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:15.0, vertical: 25),
              child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'Find Lyrics',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),

                          ),
                        ),
                        Container(

                            child: Icon(Icons.person,color: Colors.grey,))


                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.symmetric(vertical:24),
                      height: 50,
                      color: kPrimaryLight,
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Search',style: TextStyle(color:Colors.grey),
                          ),
                          Icon(Icons.search,color: Colors.grey,)
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Center(
                        child: Container(
                          //width: MediaQuery.of(context).size.width*0.8,
                          child: Column(

                            children: [
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Text('Find Lyrics', style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                              //     IconButton(
                              //         icon: Icon(Icons.account_circle_sharp), onPressed: null)
                              // ],),
                              // Container(
                              //   height: 30,
                              //   color: Colors.grey,
                              // ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical:8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: kPrimary,
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                          icon: Icon(Icons.music_note_rounded,
                                            color: Colors.white,)
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal:8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Malan Jira', style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),),
                                            Text('gjihhgqgqljg',style: TextStyle(color: Colors.grey),)
                                          ],

                                        ),
                                      ),
                                    ),
                                    IconButton(icon: Icon(
                                      Icons.favorite_border_sharp,
                                      color: Colors.black,), onPressed: null)
                                  ],),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical:8.0),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: kPrimary,
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                          icon: Icon(Icons.music_note_rounded,
                                            color: Colors.white,)
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal:8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Malan Jira', style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15),),
                                            Text('gjihhgqgqljg',style: TextStyle(color: Colors.grey),)
                                          ],

                                        ),
                                      ),
                                    ),
                                    IconButton(icon: Icon(
                                      Icons.favorite_border_sharp,
                                      color: Colors.black,), onPressed: null)
                                  ],),
                              ),


                            ],
                          ),
                        ),
                      ),
                    ),
                  ]),
            )
        )
    );
  }

}