import 'package:firebase_tutorial/modals.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final UserModal userlist;

  UserTile({required this.userlist});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: Colors.brown,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.brown,
              backgroundImage: AssetImage('assets/images/sotherby.png'),
            ),
          ),
          title: Text(userlist.name),
          subtitle: Text(userlist.email),
        ),
        margin: EdgeInsets.all(8),
      ),
    );
  }
}
