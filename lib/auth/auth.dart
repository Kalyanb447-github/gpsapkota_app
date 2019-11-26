// import 'dart:async';
// import 'package:firebase_auth/firebase_auth.dart';

// abstract class BaseAuth {

//   Future<String> currentUser();
//   Future<String> signIn(String email, String password);
//   Future<String> createUser(String email, String password);
//   Future<void> signOut();
// }

// class Auth implements BaseAuth {
//   final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

//   Future<String> signIn(String email, String password) async {
//     // AuthResult  result  = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
//     //  FirebaseUser user = result.user;
//     // return user.uid;
//   }

//   Future<String> createUser(String email, String password) async {
//     // AuthResult  result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
//     // FirebaseUser user = result.user;
//     // return user.uid;
//   }

//   Future<String> currentUser() async {
//     FirebaseUser user = await _firebaseAuth.currentUser();
//     return user != null ? user.uid : null;
//   }

//   Future<void> signOut() async {
//     return _firebaseAuth.signOut();
//   }

// }


// import 'package:firebase_auth/firebase_auth.dart';

// final FirebaseAuth auth = FirebaseAuth.instance;

// Future<FirebaseUser> handleSignInEmail({ String email, String password}) async {

//     AuthResult result = await auth.signInWithEmailAndPassword(email: email, password: password);
//     final FirebaseUser user = result.user;
//     assert(user != null);
//     assert(await user.getIdToken() != null);

//     final FirebaseUser currentUser = await auth.currentUser();
//     assert(user.uid == currentUser.uid);

//     print('signInEmail succeeded: $user');

//     return user;

//   }

// Future<FirebaseUser> handleSignUp(email, password) async {

//     AuthResult result = await auth.createUserWithEmailAndPassword(email: email, password: password);
//     final FirebaseUser user = result.user;

//     assert (user != null);
//     assert (await user.getIdToken() != null);

//     return user;

//   } 


import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'package:flutter/cupertino.dart';

class AuthService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  ///
  /// return the Future with firebase user object FirebaseUser if one exists
  ///
  Future<FirebaseUser> getUser() {
    return _auth.currentUser();
  }

  // wrapping the firebase calls
  Future logout() async {
    var result = FirebaseAuth.instance.signOut();
    notifyListeners();
    return result;
  }

  // wrapping the firebase calls
  Future createUser(
      {String firstName,
      String lastName,
      String email,
      String password}) async {
    var r = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    var u = r.user;
    UserUpdateInfo info = UserUpdateInfo();
    info.displayName = '$firstName $lastName';
    return await u.updateProfile(info);
  }

  ///
  /// wrapping the firebase call to signInWithEmailAndPassword
  /// `email` String
  /// `password` String
  ///
  Future<FirebaseUser> loginUser({String email, String password}) async {
    try {
      var result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // since something changed, let's notify the listeners...
      notifyListeners();
      return result.user;
    }  catch (e) {
      throw new AuthException(e.code, e.message);
    }
  }
}