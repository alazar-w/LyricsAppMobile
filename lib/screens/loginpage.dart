import 'package:dalvic_lyrics_sharing_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  static const String pathName = '/login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _showPassword = false;
  var _password = "";
  GlobalKey _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: kPrimary, //or set color with: Color(0xFF0000FF)
    ));
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              color: kPrimary,
              height: 300.0,
              width: double.infinity,
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image(
                        image: AssetImage("assets/images/logo.png"),
                        width: 100,
                      ),
                      Card(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 25.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: kPrimary,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      _formField('Email', () => {}),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 8.0),
                                        child: TextFormField(
                                          initialValue: _password,
                                          onChanged: (newVal) {
                                            setState(() {
                                              _password = newVal;
                                            });
                                          },
                                          obscureText: _showPassword,
                                          decoration: InputDecoration(
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  _showPassword =
                                                      !_showPassword;
                                                });
                                              },
                                              icon: Icon(_showPassword
                                                  ? Icons.visibility
                                                  : Icons.visibility_off),
                                            ),
                                            labelText: 'Password',
                                            hintStyle: TextStyle(color: kHint),
                                            fillColor: kPrimaryLight,
                                            filled: true,
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.white,
                                                    width: 1.0)),
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: kPrimary,
                                                    width: 1.0)),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                              FlatButton(
                                  minWidth: double.infinity,
                                  height: 50,
                                  onPressed: () => {},
                                  color: kPrimary,
                                  child: Text(
                                    'Login',
                                    style: TextStyle(color: Colors.white),
                                  )),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Don\'t have account '),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pushNamed('/signup');
                                        },
                                        child: Text(
                                          'Sign up',
                                          style: TextStyle(color: kPrimary),
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _formField(hint, validator, [password = false, value]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        initialValue: value,
        onChanged: (newVal) {
          setState(() {
            value = newVal;
          });
        },
        obscureText: password ? _showPassword : false,
        decoration: InputDecoration(
          suffixIcon: password
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _showPassword = !_showPassword;
                    });
                  },
                  icon: Icon(
                      _showPassword ? Icons.visibility : Icons.visibility_off),
                )
              : null,
          labelText: '$hint',
          hintStyle: TextStyle(color: kHint),
          fillColor: kPrimaryLight,
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.0)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimary, width: 1.0)),
        ),
      ),
    );
  }
}
