import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_tutorial/constants.dart';
import 'package:firebase_tutorial/screens/home/user_list.dart';
import 'package:firebase_tutorial/services/auth.dart';
import 'package:firebase_tutorial/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  String uid;

  Home({required this.uid});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();

  

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: DatabaseService(widget.uid).doc,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            MaterialButton(
              onPressed: () async {
                await _auth.signOut();
              },
              child: Icon(
                Icons.account_balance,
                color: Colors.white,
              ),
            )
          ],
          title: Text('Hooome Title'),
          backgroundColor: Colors.lightBlue,
        ),
        body: UserList(),
      ),
    );
  }
}
