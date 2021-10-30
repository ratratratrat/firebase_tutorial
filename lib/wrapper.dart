import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/screens/auth/auth.dart';
import 'package:firebase_tutorial/screens/auth/register.dart';
import 'package:firebase_tutorial/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {

    // return screen Hom or Auth

    final user = Provider.of<User?>(context);
   

   

    if(user == null){
      return Authenticate();
    }else{
     print('${user.uid} printing from Wrapper');
      return Home(uid: user.uid);
    }

  }
}
