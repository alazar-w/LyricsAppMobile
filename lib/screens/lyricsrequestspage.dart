import 'package:dalvic_lyrics_sharing_app/blocs/lyricsrequestbloc/lyricsrequest.dart';
import 'package:dalvic_lyrics_sharing_app/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'screens.dart';

class LyricsRequestsPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('My Requests'),
        centerTitle: true,
      ),
      body: BlocBuilder<LyricsRequestBloc, LyricsRequestState>(
        builder: (context, state){
          if(state is FetchedAllSuccessState){
            return ListView.builder(itemCount: state.requests.length,itemBuilder: (context, index) => ListTile(
              title: Text('${state.requests[index].musicName}'),
              subtitle: Text('${state.requests[index].artistName}'),
              trailing: IconButton(
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => EditRequestPage(request: state.requests[index],)));
                },
                icon: Icon(
                  Icons.edit,
                  color: Colors.black26,
                ),
              ),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LyricsRequestDetailPage(request: state.requests[index])));
              },
            ));
          }
          return Center(child: SpinKitWave(size: 25,color: kPrimary,));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
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