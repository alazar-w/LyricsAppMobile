import 'package:dalvic_lyrics_sharing_app/blocs/lyricsrequestbloc/lyricsrequest.dart';
import 'package:dalvic_lyrics_sharing_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'screens.dart';

class LyricsRequestsPage extends StatelessWidget {
  final _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('My Requests'),
        centerTitle: true,
      ),
      body: BlocConsumer<LyricsRequestBloc, LyricsRequestState>(
        listener: (context, state) {
          if (state is DeleteFailedState) {
            _scaffoldKey.currentState.showSnackBar(
                SnackBar(content: Text("Failed deleting lyrics request")));
          } else if (state is DeleteSuccessState) {
            _scaffoldKey.currentState.showSnackBar(
                SnackBar(content: Text("Lyrics request deleted successfully")));
            BlocProvider.of<LyricsRequestBloc>(context)..add(GetAllRequest());
          }
        },
        buildWhen: (prevState, currentState) {
          if (prevState is DeleteFailedState ||
              currentState is DeleteSuccessState) {
            return false;
          }
          return true;
        },
        builder: (context, state) {
          if (state is FetchedAllSuccessState) {
            return ListView.builder(
                itemCount: state.requests.length,
                itemBuilder: (context, index) => ListTile(
                      title: Text('${state.requests[index].musicName}'),
                      subtitle: Text('${state.requests[index].artistName}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => EditRequestPage(
                                        request: state.requests[index],
                                      )));
                            },
                            icon: Icon(
                              Icons.edit,
                              color: Colors.black26,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              BlocProvider.of<LyricsRequestBloc>(context)
                                ..add(DeleteRequest(
                                    requestId: state.requests[index].id));
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
                            builder: (context) => LyricsRequestDetailPage(
                                request: state.requests[index])));
                      },
                    ));
          } else if (state is FetchingBusyState) {
            return Center(
                child: SpinKitWave(
              size: 25,
              color: kPrimary,
            ));
          }
          return Center(
            child: GestureDetector(
                onTap: () {
                  BlocProvider.of<LyricsRequestBloc>(context)
                    ..add(GetAllRequest());
                },
                child: Text('Failed, click to retry')),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "/addrequest");
        },
        backgroundColor: kPrimary,
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}