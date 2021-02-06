import 'package:dalvic_lyrics_sharing_app/helper/constants.dart';
import 'package:flutter/material.dart';

class AddLyricsPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                    children: [
                      Icon(Icons.arrow_back),
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
                                  validator: (value){
                                    if(value.isEmpty){
                                      return 'please enter Music name!';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      filled: true,
                                      fillColor: kPrimaryLight),
                                ),SizedBox(height: 7),
                                Text('Artist Name',
                                    style:
                                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),SizedBox(height: 6),
                                TextFormField(
                                  validator: (value){
                                    if(value.isEmpty){
                                      return 'please enter Artist name!';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      filled: true,
                                      fillColor: kPrimaryLight),
                                ),SizedBox(height: 7),
                                Text('Lyrics',
                                    style:
                                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),SizedBox(height: 7),
                                Container(
                                  child: TextFormField(
                                    validator: (value){
                                      if(value.isEmpty){
                                        return 'please enter Lyrics!';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.multiline,
                                    minLines: 10,
                                    maxLines: null,
                                    decoration: InputDecoration(
                                        enabledBorder: InputBorder.none,
                                        filled: true,
                                        fillColor: kPrimaryLight),
                                  ),
                                ),SizedBox(height: 7),
                                Text('Url(optional)',
                                    style:
                                    TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                                TextFormField(
                                  decoration: InputDecoration(
                                      enabledBorder: InputBorder.none,
                                      filled: true,
                                      fillColor: kPrimaryLight),
                                ),SizedBox(height: 10),
                                Container(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(kPrimary) ),
                                    child: Text('Add Lyrics',style: TextStyle(color: Colors.white),),
                                    onPressed: (){
                                      if(_formKey.currentState.validate()){

                                      }
                                    },
                                  ),
                                )
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
