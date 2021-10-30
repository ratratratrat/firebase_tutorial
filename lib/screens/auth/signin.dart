import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/screens/loading_screen.dart';
import 'package:firebase_tutorial/services/auth.dart';
import 'package:firebase_tutorial/services/database.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../modals.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  SignIn({required this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingScreen()
        : Scaffold(
            // resizeToAvoidBottomInset: false,
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              title: Text('Sign In Page'),
              backgroundColor: Colors.brown[400],
              actions: [
                ElevatedButton.icon(
                  onPressed: () {
                    widget.toggleView();
                  },
                  icon: Icon(
                    Icons.account_circle_outlined,
                    color: Colors.white,
                  ),
                  label: Text('Register'),
                )
              ],
            ),
            body: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(children: [
                ElevatedButton(
                    onPressed: () async {
                      dynamic result = await _auth.signInAnon();
                      if (result == null) {
                        print('error');
                      } else {
                        print('signed in');
                        print(result);
                      }
                    },
                    child: Text('Sign in Anon')),
                ElevatedButton(
                    onPressed: () async {
                      dynamic result = await _auth.signOut();
                      print(result);
                    },
                    child: Text('SignOUT')),
                SizedBox(height: 30),
                Container(
                  child: Card(
                    margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
                    color: Colors.grey[300],
                    child: Form(
                      key: _formKey,
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        TextFormField(
                          decoration:
                              textFieldDecoration.copyWith(hintText: 'Email'),
                          validator: (val) =>
                              val!.isEmpty ? 'Enter an email' : null,
                          maxLength: 20,
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          },
                        ),
                        SizedBox(height: 30),
                        TextFormField(
                          decoration: textFieldDecoration.copyWith(
                              hintText: 'Password'),
                          validator: (val) => val!.length < 6
                              ? 'Enter an password 6 length'
                              : null,
                          obscureText: true,
                          onChanged: (val) {
                            setState(() {
                              password = val;
                            });
                          },
                        ),
                        SizedBox(height: 30),
                        ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  loading = true;
                                });
                               // await Future.delayed(Duration(seconds: 3));
                                dynamic result = await _auth
                                    .signinWithEmailPassword(email, password);

                                  

                                if (result == null) {
                                  setState(() {
                                    error = 'signin email password fail';
                                    loading = false;
                                  });
                                }  //no need for else, Stream catches the change and rebuilds
                              
                              } else {
                                print(email);
                                print(password);
                              }
                            },
                            child: Text('Sign in using password email')),
                        SizedBox(height: 30),
                        Text(
                          error,
                          style: TextStyle(color: Colors.red),
                        ),
                      ]),
                    ),
                  ),
                ),
              ]),
            ),
          );
  }
}
