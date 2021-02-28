import 'package:dalvic_lyrics_sharing_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/lyricsbloc/lyricsb.dart';

import 'editlyricspage.dart';
import 'lyricspage.dart';

class MyLyricsPage extends StatelessWidget {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('My lyrics'),
        centerTitle: true,
      ),

      //BlocConsumer is a widget which combines both blocListener and blocBuilder
      body: BlocConsumer<LyricsBloc, LyricsState>(
        listener: (context, state) {
          if (state is DeleteMyLyricsFailedState) {
            _scaffoldKey.currentState.showSnackBar(
                SnackBar(content: Text("Failed deleting lyrics")));
          } else if (state is DeleteMyLyricsSuccesState) {
            _scaffoldKey.currentState.showSnackBar(
                SnackBar(content: Text("Lyrics deleted successfully")));
            BlocProvider.of<LyricsBloc>(context)..add(GetMyLyrics());
          }
        },
        buildWhen: (prevState, currentState) {
          if (prevState is DeleteMyLyricsFailedState ||
              currentState is DeleteMyLyricsSuccesState) {
            return false;
          }
          return true;
        },
        builder: (context, state) {
          if (state is GetMyLyricsSuccessState) {
            return ListView.builder(
                itemCount: state.lyricss.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text('${state.lyricss[index].musicName}'),
                  subtitle: Text('${state.lyricss[index].artistName}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => EditLyricsPage(
                                lyrics: state.lyricss[index],
                              )));
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Colors.black26,

                        ),
                ),
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<LyricsBloc>(context)
                            ..add(DeleteMyLyrics(lyricsId: state.lyricss[index].id));
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 20,
                        ),
                      )
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LyricsPage(
                            lyrics: state.lyricss[index])));
                  },
                ));
          } else if (state is GetMyLyricsBusyState) {
            return Center(
                child: SpinKitWave(
                  size: 25,
                  color: kPrimary,
                ));
          }
          return Center(
            child: GestureDetector(
                onTap: () {
                  BlocProvider.of<LyricsBloc>(context)
                    ..add(GetAllLyrics());
                },
                child: Text('Failed, click to retry')),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/addlyrics");
        },
        backgroundColor: kPrimary,
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
