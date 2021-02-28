import 'package:dalvic_lyrics_sharing_app/blocs/lyricsbloc/lyricsb.dart';
import 'package:dalvic_lyrics_sharing_app/helper/constants.dart';
import 'package:dalvic_lyrics_sharing_app/models/Lyrics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'homepage.dart';

class EditLyricsPage extends StatefulWidget {
  final Lyrics lyrics;
  static const routeName = "/editlyrics";
  EditLyricsPage({@required this.lyrics}) : assert(lyrics != null);
  @override
  _EditLyricsPageState createState() => _EditLyricsPageState();
}

class _EditLyricsPageState extends State<EditLyricsPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String musicName, artistName, lyricsText, urllink;
  int id;

  @override
  void initState() {
    super.initState();
    musicName = widget.lyrics.musicName;
    artistName = widget.lyrics.artistName;
    lyricsText = widget.lyrics.lyrics;
    urllink = widget.lyrics.url;
    id = widget.lyrics.id;
  }

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
                    IconButton(icon: Icon(Icons.arrow_back), onPressed: (){Navigator.pop(context);},),
                    Text(
                      'Edit Lyrics',
                      style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Form(
                        key: _formKey,
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  'Music Name',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 7),
                                TextFormField(
                                  initialValue: musicName,
                                  onChanged: (value) {
                                    setState(() {
                                      musicName = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    fillColor: kPrimaryLight,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kPrimary)),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Field Required';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 7),
                                Text('Artist Name',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 6),
                                TextFormField(
                                  initialValue: artistName,
                                  onChanged: (value) {
                                    setState(() {
                                      artistName = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    fillColor: kPrimaryLight,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kPrimary)),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Field Required';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 7),
                                Text('Lyrics',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(height: 7),
                                Container(
                                  child: TextFormField(
                                    initialValue: lyricsText,
                                    onChanged: (value) {
                                      setState(() {
                                        lyricsText = value;
                                      });
                                    },
                                    decoration: InputDecoration(
                                      fillColor: kPrimaryLight,
                                      filled: true,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: kPrimary)),
                                    ),
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        return 'Field Required';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(height: 7),
                                Text('Url(optional)',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                TextFormField(
                                  initialValue: urllink,
                                  onChanged: (value) {
                                    setState(() {
                                      urllink = value;
                                    });
                                  },
                                  decoration: InputDecoration(
                                    fillColor: kPrimaryLight,
                                    filled: true,
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: kPrimary)),
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Field Required';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 10),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: BlocConsumer<LyricsBloc, LyricsState>(
                                    listener: (context, state) {
                                      if (state is UpdateMyLyricsFailedState) {
                                        _scaffoldKey.currentState.showSnackBar(
                                            SnackBar(content: Text(
                                                    'Failed to update lyrics')));
                                      } else if (state
                                          is UpdateMyLyricsSuccessState) {
                                        _scaffoldKey.currentState.showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    'Successfully updated')));
                                        BlocProvider.of<LyricsBloc>(context)
                                          ..add(GetMyLyrics());
                                      }
                                    },
                                    builder: (context, state) {
                                      if (state is UpdateMyLyricsBusyState) {
                                        return SpinKitWave(
                                          color: kPrimary,
                                          size: 25,
                                        );
                                      }
                                      return FlatButton(
                                          minWidth: double.infinity,
                                          height: 50.0,
                                          onPressed: () {
                                            if (_formKey.currentState
                                                .validate()) {
                                              Lyrics lyrics = Lyrics(
                                                  musicName: this.musicName,
                                                  artistName: this.artistName,
                                                  lyrics: this.lyricsText,
                                                  url: this.urllink,
                                                  id: widget.lyrics.id
                                              );
                                              BlocProvider.of<LyricsBloc>(
                                                  context)
                                                ..add(UpdateMyLyrics(lyrics: lyrics));
                                            }
                                          },
                                          color: kPrimary,
                                          child: Text(
                                            'Save',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ));
                                    },
                                  ),
                                ),
                              ]),
                        )),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
