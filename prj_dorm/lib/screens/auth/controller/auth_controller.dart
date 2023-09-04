import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prj_dorm/util/utils.dart';
import 'package:prj_dorm/models/user_model.dart';
import 'package:prj_dorm/screens/auth/repository/auth_methods.dart';
import 'package:riverpod/riverpod.dart';

final userProvider = StateProvider<UserModel?>((ref) => null);

// Provider
final AuthControllerProvider = StateNotifierProvider<AuthController, bool>(
  (ref) => AuthController(
    authMethods: ref.watch(authMethodsProvider),
    ref: ref,
  ),
);

final authStateChangeProvider = StreamProvider((ref) {
  final authController = ref.watch(AuthControllerProvider.notifier);
  return authController.authStateChange;
});

final getUserDataProvider = StreamProvider.family((ref, String uid) {
  final authController = ref.watch(AuthControllerProvider.notifier);
  return authController.getUserData(uid);
});

class AuthController extends StateNotifier<bool> {
  final AuthMethods _authMethods;
  final Ref _ref;
// for the scaability we have to consider user update their info
  AuthController({required AuthMethods authMethods, required Ref ref})
      : _authMethods = authMethods,
        _ref = ref,
        super(false);

  Stream<User?> get authStateChange => _authMethods.authStateChange;

  void signUpUser(
    BuildContext context, {
    required String email,
    required String password,
    required String username,
    required String bio,
  }) async {
    state = true;
    final user = await _authMethods.signUpUser(
        email: email, password: password, username: username, bio: bio);
    state = false;
    user.fold(
      (l) => showSnackBar(context, l.message),
      (userModel) =>
          _ref.read(userProvider.notifier).update((state) => userModel),
    );
  }

  Stream<UserModel> getUserData(String uid) {
    return _authMethods.getUserData(uid);
  }
}

// class AuthController {
//   final AuthRepository _authRepository;

//   AuthController({required AuthRepository authRepository})
//       : _authRepository = authRepository;
// }
