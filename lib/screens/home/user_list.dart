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

      //  var docs = userList.docs.map((doc) { 
      //   return doc.data() as Map<String, dynamic>;
       
      //    });
       
      //  var doc1 = docs.map((e) {
         
      //    return UserModal.fromJson(e);
      //  });


      //  print(doc1.map((e) => e.name));
      

      for (var doc in userList.docs) {
        Map<String, dynamic> obj = doc.data() as Map<String, dynamic>;

        var result = UserModal.fromJson(obj);

        print(result.name);
      }


    }

    return Container();
  }
}
