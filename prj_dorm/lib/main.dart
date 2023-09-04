import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prj_dorm/screens/auth/screen/login_screen.dart';
import 'package:prj_dorm/screens/home/home_screen.dart';
import 'package:prj_dorm/util/error_text.dart';
import 'package:prj_dorm/util/loader.dart';
import 'package:prj_dorm/models/user_model.dart';
import 'package:prj_dorm/router.dart';
import 'package:prj_dorm/screens/auth/controller/auth_controller.dart';
import 'package:prj_dorm/util/colors.dart';
import 'package:routemaster/routemaster.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
  //   const ProviderScope(
  //     child: MyApp(),
  //   ),
  // );
}

// class MyApp extends ConsumerStatefulWidget {
//   const MyApp({super.key});

//   @override
//   ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
// }

// class _MyAppState extends ConsumerState<MyApp> {
//   UserModel? userModel;

//   void getData(WidgetRef ref, User data) async {
//     userModel = await ref
//         .watch(AuthControllerProvider.notifier)
//         .getUserData(data.uid)
//         .first;
//     ref.read(userProvider.notifier).update((state) => userModel);
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ref.watch(authStateChangeProvider).when(
//         data: (data) => MaterialApp.router(
//               debugShowCheckedModeBanner: false,
//               title: 'dormroom',
//               theme: ThemeData.dark().copyWith(
//                 scaffoldBackgroundColor: mobileBackgroundColor,
//               ),
//               routerDelegate: RoutemasterDelegate(
//                 routesBuilder: (context) {
//                   if (data != null) {
//                     getData(ref, data);
//                     if (userModel != null) {
//                       return loggedInRoute;
//                     }
//                   }
//                   return loggedOutRoute;
//                 },
//               ),
//               routeInformationParser: const RoutemasterParser(),
//             ),
//         error: (error, StackTrace) => ErrorText(error: error.toString()),
//         loading: () => const Loader());
//   }
// }

// class MyApp extends ConsumerWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return ref.watch(authStateChangeProvider).when(
//         data: (data) => MaterialApp.router(
//               debugShowCheckedModeBanner: false,
//               title: 'dormroom',
//               theme: ThemeData.dark().copyWith(
//                 scaffoldBackgroundColor: mobileBackgroundColor,
//               ),
//               routerDelegate: RoutemasterDelegate(
//                 routesBuilder: (context) {
//                   if (data != null) {
//                     return loggedInRoute;
//                   }
//                   return loggedOutRoute;
//                 },
//               ),
//               routeInformationParser: const RoutemasterParser(),
//               // home: const ResponsiveLayout(
//               //     mobileScreenLayout: MobileScreenLayout(),
//               //     webScreenLayout: WebScreenLayout()),
//               // home: SignupScreen(), //LoginScreen(),
//             ),
//         error: (error, StackTrace) => ErrorText(error: error.toString()),
//         loading: () => const Loader());
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'dormroom',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: const ResponsiveLayout(
      //     mobileScreenLayout: MobileScreenLayout(),
      //     webScreenLayout: WebScreenLayout()),
      home: LoginScreen(),
    );
  }
}
