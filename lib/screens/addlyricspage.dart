import 'package:dalvic_lyrics_sharing_app/blocs/lyricsbloc/lyricsb.dart';
import 'package:dalvic_lyrics_sharing_app/helper/constants.dart';
import 'package:dalvic_lyrics_sharing_app/models/Lyrics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'homepage.dart';

class AddLyricsPage extends StatefulWidget {
  static const routeName="/addlyrics";

  @override
  _AddLyricsPageState createState() => _AddLyricsPageState();
}

class _AddLyricsPageState extends State<AddLyricsPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String musicName ,artistName,lyricsText,urllink;
  int id;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                    children: [
                      IconButton(icon: Icon(Icons.arrow_back), onPressed: (){Navigator.of(context).pop();},),
                      Container(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.2),
                        child: Text(
                            'Add Lyrics',
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical:20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  'Music Name',
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),

                                ),SizedBox(height: 7),
                            TextFormField(
                              onChanged: (value){
                                setState(() {
                                  musicName = value;
                                });
                              },
                              decoration: InputDecoration(
                                fillColor: kPrimaryLight,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kPrimary)),
                              ),
                              validator: (value) {
                                if(value.isEmpty){
                                  return 'Field Required';
                                }
                                return null;
                              },
                            ),SizedBox(height: 7),
                                Text('Artist Name',
                                    style:
                                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),SizedBox(height: 6),
                            TextFormField(
                              onChanged: (value){
                                setState(() {
                                  artistName = value;
                                });
                              },
                              decoration: InputDecoration(
                                fillColor: kPrimaryLight,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: kPrimary)),
                              ),
                              validator: (value) {
                                if(value.isEmpty){
                                  return 'Field Required';
                                }
                                return null;
                              },
                            ),SizedBox(height: 7),
                                Text('Lyrics',
                                    style:
                                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),SizedBox(height: 7),
                                Container(
                                  child: TextFormField(
                                    onChanged: (value){
                                      setState(() {
                                        lyricsText = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      fillColor: kPrimaryLight,
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: Colors.white)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: kPrimary)),
                                    ),
                                    validator: (value) {
                                      if(value.isEmpty){
                                        return 'Field Required';
                                      }
                                      return null;
                                    },
                                  ),
                                ),SizedBox(height: 7),
                                Text('Url(optional)',
                                    style:
                                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                    TextFormField(
                      onChanged: (value){
                        setState(() {
                          urllink = value;
                        });
                      },
                      decoration: InputDecoration(
                        fillColor: kPrimaryLight,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: kPrimary)),
                      ),
                      validator: (value) {
                        if(value.isEmpty){
                          return 'Field Required';
                        }
                        return null;
                      },
                    ),SizedBox(height: 10),

                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical:8.0),
                                  child: BlocConsumer<LyricsBloc, LyricsState>(
                                    listener: (context, state){
                                      if(state is LyricsFailedState){
                                        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('${state.errorMessage}')));
                                      }else if(state is LyricsCreateSuccessState){
                                        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Successfully submitted')));
                                        BlocProvider.of<LyricsBloc>(context)..add(GetAllLyrics());
                                      }
                                    },
                                    builder: (context, state){
                                      if(state is LyricsBusyState){
                                        return SpinKitWave(color: kPrimary,size: 25,);
                                      }
                                      return FlatButton(
                                          minWidth: double.infinity,
                                          height: 50.0,
                                          onPressed: () {
                                            if(_formKey.currentState.validate()){
                                              Lyrics lyrics = Lyrics(musicName: this.musicName, artistName: this.artistName, lyrics: this.lyricsText, url: this.urllink);
                                              // User user = User();
                                              // user.name = name;
                                              // user.email = email;
                                              // user.password = password;
                                              BlocProvider.of<LyricsBloc>(context)..add(CreateLyricsEvent(lyrics: lyrics));
                                            }
                                          },
                                          color: kPrimary,
                                          child: Text(
                                            'Save',
                                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                                          ));
                                    },
                                  ),
                                ),
                              ]
                          ),
                        )
                    ),
                  ),
                )


              ],
            ),
          ),
          )


    );
  }
}
