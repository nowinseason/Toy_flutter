import "dart:typed_data";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/material.dart";
import "package:fpdart/fpdart.dart";
import "package:prj_dorm/constants/constants.dart";
import "package:prj_dorm/constants/firebase_constants.dart";
import "package:prj_dorm/models/user_model.dart";
import "package:prj_dorm/providers/firebase_providers.dart";
import "package:prj_dorm/util/type_defs.dart";
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

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollections);

  // sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio, //delete bio
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
        late UserModel userModel;

        if (cred.additionalUserInfo!.isNewUser) {
          userModel = UserModel(
              username: username ?? 'No Name',
              email: cred.user!.email ?? '',
              profilePic: cred.user!.photoURL ?? Constants.avatarDefault,
              banner: Constants.bannerDefault,
              uid: cred.user!.uid);
          await _users.doc(cred.user!.uid).set(userModel.toMap());
        } else {}
        ;
        print(cred.user!.uid);
        //store in database
        return res;
      }
    } catch (err) {
      rethrow;
      res = err.toString();
    }
    return (res);
  }

  Stream<UserModel> getUserData(String uid) {
    return _users.doc(uid).snapshots().map(
        (event) => UserModel.fromMap(event.data() as Map<String, dynamic>));
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
