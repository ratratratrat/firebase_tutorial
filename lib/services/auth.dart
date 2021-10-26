import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {


  final FirebaseAuth _auth = FirebaseAuth.instance;



  // signin anon

  Future signInAnon() async {


    try {
      UserCredential result = await _auth.signInAnonymously();
      // user = result.user;
      return result;
    } catch (e) {
      print(e);
      return null;
    }
  }

// sign in email

// register email

// sign out

  Future signOut() async {
    await _auth.signOut();
    return _auth  ;
  }


}
