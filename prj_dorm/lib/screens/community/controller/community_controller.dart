import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prj_dorm/constants/constants.dart';
import 'package:prj_dorm/models/community_model.dart';
import 'package:prj_dorm/screens/auth/controller/auth_controller.dart';
import 'package:prj_dorm/screens/community/repository/community_repository.dart';
import 'package:prj_dorm/util/utils.dart';
import 'package:routemaster/routemaster.dart';

final userCommunitiesProvider = StreamProvider((ref) {
  final CommunityController = ref.watch(communityControllerProvider.notifier);
  return CommunityController.getUserCommunities();
});

final communityControllerProvider =
    StateNotifierProvider<CommunityController, bool>((ref) {
  final communityRepository = ref.watch(communityRepositoryProvider);
  return CommunityController(
      communityRepository: communityRepository, ref: ref);
});

final getCommunityByNameProvider = StreamProvider.family((ref, String name) {
  return ref
      .watch(communityControllerProvider.notifier)
      .getCommunityByName(name);
});

class CommunityController extends StateNotifier<bool> {
  final CommunityRepository _communityRepository;
  final Ref _ref;

  CommunityController({
    required CommunityRepository communityRepository,
    required Ref ref,
  })  : _communityRepository = communityRepository,
        _ref = ref,
        super(false);

  void createCommunity(String name, BuildContext context) async {
    state = true;
    final uid = _ref.read(userProvider)?.uid ?? '';

    Community community = Community(
      id: name,
      name: name,
      banner: Constants.bannerDefault,
      avatar: Constants.avatarDefault,
      members: [uid],
      mods: [uid],
    );

    final res = await _communityRepository.createCommunity(community);
    state = false;
    // check the community already exists
    res.fold((l) => showSnackBar(context, l.message), (r) {
      showSnackBar(context, 'Community Created Sussessfully');
      Routemaster.of(context).pop();
    });
  }

  Stream<List<Community>> getUserCommunities() {
    final uid = _ref.read(userProvider)!.uid;
    return _communityRepository.getUserCommunity(uid);
  }

  Stream<Community> getCommunityByName(String name) {
    return _communityRepository.getCommunityByName(name);
  }
}
