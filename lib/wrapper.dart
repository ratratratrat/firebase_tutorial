import 'package:firebase_tutorial/screens/auth/auth.dart';
import 'package:firebase_tutorial/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    // return screen Hom or Auth

    return Authenticate();
  }
}
