import 'package:firebase_tutorial/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text('Sign In Page'),
        backgroundColor: Colors.brown[400],
      ),
      body: Column(children: [
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
        ElevatedButton(onPressed: () async {
          dynamic result = await _auth.signOut();
          print(result);
        }, child: Text('SignOUT'))
      ]),
    );
  }
}
