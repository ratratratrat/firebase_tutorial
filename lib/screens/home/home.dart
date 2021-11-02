import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_tutorial/constants.dart';
import 'package:firebase_tutorial/modals.dart';
import 'package:firebase_tutorial/screens/home/settings_form.dart';
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


  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.all(8),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<UserModal>?>.value(
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
            ),
            MaterialButton(
              onPressed: () => _showSettingsPanel(),
              child: Icon(
                Icons.settings,
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
