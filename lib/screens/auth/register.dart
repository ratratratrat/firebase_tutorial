import 'package:firebase_tutorial/constants.dart';
import 'package:firebase_tutorial/screens/auth/signin.dart';
import 'package:firebase_tutorial/screens/loading_screen.dart';
import 'package:firebase_tutorial/services/auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({required this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  bool showSignin = true;

  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingScreen()
        : Scaffold(
            appBar: AppBar(
              title: Text('Register Page'),
              actions: [
                ElevatedButton.icon(
                    onPressed: () {
                      widget.toggleView();
                    },
                    icon: Icon(Icons.account_circle_rounded),
                    label: Text('Sign IN'))
              ],
            ),
            body: Align(
              alignment: Alignment.topCenter,
              child: Container(
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
                        decoration:
                            textFieldDecoration.copyWith(hintText: 'Passwood'),
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
                            //   await Future.delayed(Duration(seconds: 3));
                              setState(() {
                                loading = true;
                              });
                              dynamic result =
                                  await _auth.registerWithEmailandPassword(
                                      email, password);

                              if (result == null) {
                                setState(() {
                                  error = 'Register fail';
                                  loading = false;
                                });
                              } 
                            } else {
                              print(email);
                              print(password);
                            }
                          },
                          child: Text('Register')),
                      SizedBox(height: 30),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red),
                      ),
                    ]),
                  ),
                ),
              ),
            ),
          );
  }
}
