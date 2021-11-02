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


List<UserModal> _userlistfromModal (QuerySnapshot snapshot){
  return snapshot.docs.map((e) {
      return UserModal.fromJson(e.data() as Map<String, dynamic>);
  }).toList();
}


// get Docutment from snapshot

UserModal _userDocSnap (DocumentSnapshot snapshot){
  return UserModal.fromJson(snapshot.data() as Map<String, dynamic>); 
}


// get user doc sgtream

Stream<UserModal> get docSnap {
  return userCollection.doc(uid).snapshots().map(_userDocSnap);
}
 
// get Firebase Stream
  
  Stream<List<UserModal>> get doc {
    return userCollection.snapshots().map(_userlistfromModal);
  }



}
