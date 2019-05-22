import 'package:app2/src/models/user_model.dart';
import 'package:app2/src/services/firebase/_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class AuthFirebase {
  AuthFirebase() {
    FirebaseAuth.instance.setLanguageCode("ar");
  }
  User _parse(FirebaseUser fUser) {
    return User((b) => [
          b..id = fUser.uid,
          b..email = fUser.email,
          b..phone = fUser.phoneNumber,
          // b..profilePhoto = fUser.photoUrl,
          b..name = fUser.displayName
        ]);
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser _user = await FirebaseAuth.instance.currentUser();
    // ? parsing is not recommend since the returned object has useful functions
    return _user;
  }

  Future<User> registerUsingEmailPassword(
      {@required String email,
      @required String password,
      String name,
      String photoUrl,
      String phoneNumber}) async {
    // create auth user
    print("DATA: " + email.toString());
    FirebaseUser user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    // save user profile to auth user
    // var _u = UserUpdateInfo();
    // _u.displayName = name;
    // _u.photoUrl = photoUrl;
    // await user.updateProfile(_u);
    // save auth user in users table

    // send vervication email
    // return user
    return _parse(user);
  }


  Future<User> signInWithEmailAndPassword(
      {String email, String password}) async {
    FirebaseUser user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    print(user.toString());
    return _parse(user);
  }

  Future<User> updateAuthProfile() {}
}
