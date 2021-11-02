import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/screens/auth/register.dart';
import 'package:firebase_tutorial/services/auth.dart';
import 'package:firebase_tutorial/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'constants.dart';

// thestsed
// cdoner deals vscodejsfsa
//sfjnsdf

//terat1
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String testing;
    return StreamProvider<User?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(home: Wrapper()),
    );
  }
}
