import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_tutorial/modals.dart';


class DatabaseService {
  final String uid;
  DatabaseService(this.uid);

// collection reference

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('userCollection');

  Future updateUserData(String name, String email) async {
    return await userCollection.doc(uid).set({'name': name, 'email': email , 'uid' : uid});
  }

  // set List of User




// get Firebase Stream
  
  Stream<QuerySnapshot> get doc {
    return userCollection.snapshots();
  }

  //   Stream<List<UserModal>> getUserList() {
  //   return userCollection
  //       .snapshots()
  //       .map((snapShot) => snapShot.docs
  //       .map((e) => UserModal.fromJson(e.data))
  //       .toList());
  // }

}
