import 'dart:convert';

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
    final userList = Provider.of<QuerySnapshot?>(context);

    //  print(userList?.docs);

    if (userList != null) {
      //   List<Object?> list =  userList.docs.map((e) => e.data()).toList();
        
     
      // var docs = userList.docs.map((doc) => doc.data());

  
       
      for (var doc in userList.docs) {

         Map<String, dynamic> obj = doc.data() as Map<String, dynamic>;
        
        
       var result = UserModal.fromJson(obj);

       print(result.uid);
      }
    }

    return Container();
  }
}
