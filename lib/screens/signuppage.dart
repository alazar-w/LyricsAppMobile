import 'package:dalvic_lyrics_sharing_app/blocs/signupbloc/signup.dart';
import 'package:dalvic_lyrics_sharing_app/constants.dart';
import 'package:dalvic_lyrics_sharing_app/models/user.dart';
import 'package:dalvic_lyrics_sharing_app/screens/loginpage.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'screens.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  String name, email, password, confirmPassword;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white, //or set color with: Color(0xFF0000FF)
    ));
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    'Signup',
                    style: TextStyle(
                        color: kPrimary,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ),
                Form(
                  key: _formKey,
                    child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        onChanged: (value){
                          setState(() {
                            name = value;
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
                          if(value.isEmpty){
                            return 'Field Required';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        onChanged: (value){
                          setState(() {
                            email = value;
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
                          if(!EmailValidator.validate(value)){
                            return "Invalid email address";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        onChanged: (value){
                          setState(() {
                            password = value;
                          });
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          fillColor: kPrimaryLight,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: kPrimary)),
                        ),
                        validator: (value) {
                          if(value.length < 4){
                            return "Minimum password length must be 4";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: TextFormField(
                        onChanged: (value){
                          setState(() {
                            confirmPassword = value;
                          });
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          fillColor: kPrimaryLight,
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: kPrimary)),
                        ),
                        validator: (value) {
                          if(value != password){
                            return "Passwords don't match!";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical:8.0),
                      child: BlocConsumer<SignUpBloc, SignUpState>(
                        listener: (context, state){
                          if(state is FailedState){
                            _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('${state.errorMessage}')));
                          }else if(state is SuccessState){
                            _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Successfully registered~')));

                            Navigator.of(context).pushNamed(HomePage.pathName);
                          }
                        },
                        builder: (context, state){
                          if(state is BusyState){
                            return SpinKitWave(color: kPrimary,size: 25,);
                          }
                          return FlatButton(
                              minWidth: double.infinity,
                              height: 50.0,
                              onPressed: () {
                                if(_formKey.currentState.validate()){
                                  User user = User();
                                  user.name = name;
                                  user.email = email;
                                  user.password = password;
                                  BlocProvider.of<SignUpBloc>(context)..add(SignUp(user: user));
                                }
                              },
                              color: kPrimary,
                              child: Text(
                                'Sign up',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                              ));
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account '),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/login');
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(color: kPrimary),
                              ))
                        ],
                      ),
                    )
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
