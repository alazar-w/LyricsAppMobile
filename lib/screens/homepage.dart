import 'package:dalvic_lyrics_sharing_app/blocs/favoriteBloc/favorite.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/favoriteBloc/favoriteBloc.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/favoriteBloc/favoriteEvent.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/songBloc/song.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/songBloc/songBloc.dart';
import 'package:dalvic_lyrics_sharing_app/helper/constants.dart';
import 'package:dalvic_lyrics_sharing_app/models/song.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatelessWidget {
  static const String pathName = '/home';
  SongBloc songBloc = SongBloc();
  FavoriteBloc favBloc = FavoriteBloc();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    songBloc.add(FetchSongs());
    // TODO: implement build
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext ctx) => SongBloc()),
        BlocProvider(create: (BuildContext ctx) => FavoriteBloc())
      ],
      child: Scaffold(
          key: _scaffoldKey,
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      'Find Lyrics',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      child: Icon(
                    Icons.person,
                    color: Colors.grey,
                  ))
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(vertical: 24),
                height: 50,
                color: kPrimaryLight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Search',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                    )
                  ],
                ),
              ),
              BlocListener<SongBloc, SongState>(
                listener: (context, state) {
                  print('$state hello state');
                },
                child: BlocBuilder(
                  cubit: songBloc,
                  builder: (context, state) {
                    if (state is LoadingSongState) {
                      return Center(
                        child: SpinKitWave(
                          color: kPrimary,
                          size: 25,
                        ),
                      );
                    }
                    if (state is SuccessSongState) {
                      print('$state is the state');
                      return SingleChildScrollView(
                        child: Center(
                          child: Container(
                            child: Column(
                              children: createSongView(state.songs),
                            ),
                          ),
                        ),
                      );
                    } else if (state is ErrorSongState) {
                      return Text("Something went wrong");
                    }
                    return Text("Something went wrong down there");
                  },
                ),
              ),
            ]),
          ))),
    );
  }

  List<Widget> createSongView(List<Song> songs) {
    List<Widget> lyrics = [];
    for (var i = 0; i < songs.length; i++) {
      lyrics.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: kPrimary,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                  icon: Icon(
                Icons.music_note_rounded,
                color: Colors.white,
              )),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      songs[i].music_name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      songs[i].artist_name,
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
            BlocConsumer<FavoriteBloc, FavoriteState>(
              listener: (context, state) {
                if (state is SuccessFavoriteState) {
                  print(state.message);
                  // _scaffoldKey.currentState.showSnackBar(SnackBar(
                  //   content: Text('${state.message}'),
                  //   duration: Duration(milliseconds: 1850),
                  // ));
                }
                if (state is DeleteFavoriteState) {
                  print(state.message);
                  // _scaffoldKey.currentState.showSnackBar(SnackBar(
                  //   content: Text('${state.message}'),
                  //   duration: Duration(microseconds: 1850),
                  // ));
                }
              },
              cubit: favBloc,
              builder: (context, state) {
                if (state is SuccessFavoriteState &&
                    state.favorite.song_id == songs[i].id) {
                  return IconButton(
                      icon: Icon(Icons.favorite, color: Colors.orange),
                      onPressed: () => {
                            favBloc.add(RemoveFromFavorite(
                                song: songs[i],
                                user_id: "602b918881836824315844ab"))
                          });
                } else {
                  return IconButton(
                      icon: Icon(Icons.favorite_border_outlined,
                          color: Colors.black),
                      onPressed: () => {
                            favBloc.add(AddToFavorite(
                                song: songs[i],
                                user_id: "602b918881836824315844ab"))
                          });
                }
              },
            ),
          ],
        ),
      ));
    }
    return lyrics;
  }
}
