import 'package:dalvic_lyrics_sharing_app/blocs/authenticationbloc/authenticationbloc.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/authenticationbloc/authenticationevent.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/authenticationbloc/authenticationstate.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/userbloc/userbloc.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/userbloc/userevent.dart';
import 'package:dalvic_lyrics_sharing_app/blocs/userbloc/userstate.dart';
import 'package:dalvic_lyrics_sharing_app/models/user.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../constants.dart';

class UpdateProfile extends StatefulWidget {
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {

  User _user;
  String confirmPassword;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          if(state is Authenticated){
            _user = state.user;
          }
        },
        builder: (context, state) {
          if( state is Authenticated)
            _user = state.user;
          return Scaffold(
            key: _scaffoldKey,
            appBar: AppBar(
              title: Text('Update Profile'),
            ),
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          initialValue: _user.name,
                          onChanged: (value) {
                            setState(() {
                              _user.name = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Full Name',
                            fillColor: kPrimaryLight,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kPrimary)),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Field Required';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: TextFormField(
                          initialValue: _user.email ,
                          onChanged: (value) {
                            setState(() {
                              _user.email = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: 'Email',
                            fillColor: kPrimaryLight,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: kPrimary)),
                          ),
                          validator: (value) {
                            if (!EmailValidator.validate(value)) {
                              return "Invalid email address";
                            }
                            return null;
                          },
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                      //   child: TextFormField(
                      //     initialValue: state.user.password,
                      //     onChanged: (value) {
                      //       setState(() {
                      //         _user.password = value;
                      //       });
                      //     },
                      //     obscureText: true,
                      //     decoration: InputDecoration(
                      //       hintText: 'Password',
                      //       fillColor: kPrimaryLight,
                      //       filled: true,
                      //       enabledBorder: OutlineInputBorder(
                      //           borderSide: BorderSide(color: Colors.white)),
                      //       focusedBorder: OutlineInputBorder(
                      //           borderSide: BorderSide(color: kPrimary)),
                      //     ),
                      //     validator: (value) {
                      //       return null;
                      //     },
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                      //   child: TextFormField(
                      //     initialValue: state.user.password,
                      //     onChanged: (value) {
                      //       setState(() {
                      //         confirmPassword = value;
                      //       });
                      //     },
                      //     obscureText: true,
                      //     decoration: InputDecoration(
                      //       hintText: 'Confirm Password',
                      //       fillColor: kPrimaryLight,
                      //       filled: true,
                      //       enabledBorder: OutlineInputBorder(
                      //           borderSide: BorderSide(color: Colors.white)),
                      //       focusedBorder: OutlineInputBorder(
                      //           borderSide: BorderSide(color: kPrimary)),
                      //     ),
                      //     validator: (value) {
                      //       // if (value != state.user.password) {
                      //       //   return "Passwords don't match!";
                      //       // }
                      //       return null;
                      //     },
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: BlocConsumer<UserBloc, UserState>(
                          listener: (context, state) {
                            if (state is UserUpdatedFailed) {
                              _scaffoldKey.currentState.showSnackBar(
                                  SnackBar(content: Text('Update Failed')));
                            } else if (state is UserUpdatedSuccess) {
                              _scaffoldKey.currentState.showSnackBar(
                                  SnackBar(content: Text('Upadate Successful')));
                              BlocProvider.of<AuthenticationBloc>(context)
                                ..add(SaveAuthenticationInfo(user: _user))
                                ..add(InitEvent());
                            }
                          },
                          builder: (context, state) {
                            if (state is UserUpdatedBusy) {
                              return SpinKitWave(
                                color: kPrimary,
                                size: 25,
                              );
                            }
                            return FlatButton(
                                minWidth: double.infinity,
                                height: 50.0,
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    User user = User();
                                    user.name = _user.name;
                                    user.email = _user.email;
                                    user.id = _user.id;
                                    // user.password = _user.password;
                                    BlocProvider.of<UserBloc>(context)
                                      ..add(UpdateUser(user: user));
                                  }
                                },
                                color: kPrimary,
                                child: Text(
                                  'Update',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ));
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
          return Center(child: SpinKitWave(size: 25,color: kPrimary));
        });
  }
}
