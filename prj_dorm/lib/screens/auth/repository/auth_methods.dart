import "dart:typed_data";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:prj_dorm/providers/firebase_providers.dart";
import "package:riverpod/riverpod.dart";

final authMethodsProvider = Provider((ref) => AuthMethods(
    firestore: ref.read(firestoreProvider), auth: ref.read(authProvider)));

class AuthMethods {
  final FirebaseAuth _auth; // = FirebaseAuth.instance;
  final FirebaseFirestore _firestore;

  AuthMethods({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
  })  : _auth = auth,
        _firestore = firestore;

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

// class AuthRepository {
//   final FirebaseFirestore _firestore;
//   final FirebaseAuth _auth;
//   final SchoolSignin _schoolSingIn;

//   AuthRepository({
//     required FirebaseFirestore firestore,
//     required FirebaseAuth auth,
//     required SchoolSignIn schoolSignIn,

//   })  : _auth = auth,
//         _firestore = firestore,
//         _schoolSignIn = schoolSignIn;

//   void signInWithSchool() async {
//     String res = "some error occurred"; //result
//     try{
//       final SchoolSignInAccount? schoolUser =await _schoolSingIn.signIn();
//       final schoolAuth = await schoolUser?.authentification;
//       final credential = SchoolAuthProvider.credential(
//         accessToken: schoolAuth.accessToken,
//         idToken: schoolAuth?.idToken, 
//       );
//       UserCredential userCredential = _auth.signInWithCredential(credential);
//     } catch (err){
//       res = err.toString();
//     } 
//     return res;
//   }
// }
