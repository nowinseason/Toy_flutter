import 'package:firebase_auth/firebase_auth.dart';
import 'package:prj_dorm/screens/auth/repository/auth_methods.dart';
import 'package:riverpod/riverpod.dart';

// Provider
final AuthControllerProvider = Provider(
    (ref) => AuthController(authMethods: ref.read(authMethodsProvider)));

class AuthController {
  final AuthMethods _authMethods;

  AuthController({required AuthMethods authMethods})
      : _authMethods = authMethods;
}

// class AuthController {
//   final AuthRepository _authRepository;

//   AuthController({required AuthRepository authRepository})
//       : _authRepository = authRepository;
// }
