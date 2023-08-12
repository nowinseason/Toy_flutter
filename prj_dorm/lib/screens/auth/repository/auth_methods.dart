import "dart:typed_data";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
    //required Uint8List file,
  }) async {
    String res = "some error occurred"; //result
    try {
      if (email.isNotEmpty ||
              password.isNotEmpty ||
              username.isNotEmpty ||
              bio.isNotEmpty //||file != null
          ) {
        //register users
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!.uid);
        //store in database
        _firestore.collection('users').doc(cred.user!.uid).set({
          // not to overwrites
          'username': username,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          // should add more unique user
        });
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
