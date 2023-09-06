import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:prj_dorm/constants/firebase_constants.dart';
import 'package:prj_dorm/models/community_model.dart';
import 'package:prj_dorm/providers/firebase_providers.dart';
import 'package:prj_dorm/util/failure.dart';
import 'package:prj_dorm/util/type_defs.dart';

final communityRepositoryProvider = Provider((ref) {
  return CommunityRepository(firestore: ref.watch(firestoreProvider));
});

class CommunityRepository {
  final FirebaseFirestore _firestore;
  CommunityRepository({required FirebaseFirestore firestore})
      : _firestore = firestore;

  FutureVoid createCommunity(Community community) async {
    try {
      var communityDoc = await _communities.doc(community.name).get();
      if (communityDoc.exists) {
        throw 'Community with the same name exists';
      }
      return right(_communities.doc(community.name).set(community.toMap()));
    } on FirebaseException catch (err) {
      return left(Failure(err.message!));
    } catch (err) {
      return left(Failure(err.toString()));
    }
  }

  Stream<List<Community>> getUserCommunity(String uid) {
    return _communities
        .where('members', arrayContains: uid)
        .snapshots()
        .map((event) {
      List<Community> communities = [];
      for (var doc in event.docs) {
        communities.add(
          Community.fromMap(doc.data() as Map<String, dynamic>),
        );
      }
      return communities;
    });
  }

  // Stream<Community> getCommunityByName(String name) {
  //   //print(_communities.doc(name));
  //   return _communities.doc(name).snapshots().map(
  //       (event) => Community.fromMap(event.data() as Map<String, dynamic>));
  // }

  CollectionReference get _communities =>
      _firestore.collection(FirebaseConstants.communityCollections);

  Stream<Community> getCommunityByName(String name) {
    //print(_communities.doc(name));
    return _communities.doc(name).snapshots().map(
        (event) => Community.fromMap(event.data() as Map<String, dynamic>));
  }
}
