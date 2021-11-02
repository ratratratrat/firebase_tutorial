import 'dart:convert';

import 'package:firebase_tutorial/screens/home/userlist_tile.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:firebase_tutorial/modals.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    final userList = Provider.of<List<UserModal>?>(context);

    
    //  print(userList?.docs);

    if (userList != null) {
      userList.forEach((element) {
        print(element.name);
        print(element.email);
      });

      // for (var doc in userList.docs) {
      //   Map<String, dynamic> obj = doc.data() as Map<String, dynamic>;
      //   var result = UserModal.fromJson(obj);
      //   print(result.name);
      // }
    return ListView.builder(
      itemBuilder: (context, index) {
        return UserTile(userlist: userList[index]);
      },
      itemCount: userList.length,
    );
    }else{return Container();}


  }
}
