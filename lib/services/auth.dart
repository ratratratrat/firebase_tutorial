import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_tutorial/modals.dart';
import 'package:firebase_tutorial/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // User1? _userFromFirebase(UserCredential user) {
  //   return  user != null ? User1(uid: user.user!.uid) : null;
  // }

  // create stream to listen to changes

  Stream<User?> get user {
    return _auth.authStateChanges();
  }

  // signin anon

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      // user = result.user;
    
      return (result);
    } catch (e) {
      print(e);
      return null;
    }
  }

// sign in email

  Future signinWithEmailPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return (result);
    } catch (e) {
      print('signin E P error');
      return null;
    }
  }

// register email

  Future registerWithEmailandPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

 await  DatabaseService(result.user!.uid).updateUserData('Edward', email);
      return (result);
    } catch (e) {
      print('register E P error');
      return null;
    }
  }

// sign out

  Future signOut() async {
    await _auth.signOut();
    return _auth;
  }
}
