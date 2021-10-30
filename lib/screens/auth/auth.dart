import 'package:firebase_tutorial/screens/auth/register.dart';
import 'package:firebase_tutorial/screens/auth/signin.dart';
import 'package:firebase_tutorial/screens/loading_screen.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignin = true;

  void toggleView(){
    setState(() => showSignin = !showSignin);
  }

  @override
  Widget build(BuildContext context) {

    if(showSignin == true){
      return SignIn(toggleView: toggleView);
    //return LoadingScreen();
    }else{
      return Register(toggleView: toggleView);
    }

 
  }
}


