// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fpdart/fpdart.dart';
// import 'package:prj_dorm/constants/firebase_constants.dart';
// import 'package:prj_dorm/util/failure.dart';
// import 'package:prj_dorm/util/type_defs.dart';

// class CommunityRepository {
//   final FirebaseFirestore _firestore;
//   CommunityRepository({required FirebaseFirestore firestore})
//       : _firestore = firestore;

//   FutureVoid createCommunity() async {
//     try {} on FirebaseException catch (err) {
//       return left(Failure(err.message!));
//     } catch (err) {
//       return left(Failure(err.toString()));
//     }
//   }

//   CollectionReference get _communities =>
//       _firestore.collection(FirebaseConstants.communityCollections);
// }
