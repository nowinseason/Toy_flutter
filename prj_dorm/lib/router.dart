import 'package:flutter/material.dart';
import 'package:prj_dorm/screens/auth/screen/login_screen.dart';
import 'package:prj_dorm/screens/auth/screen/signup_screen.dart';
import 'package:prj_dorm/screens/community/screen/community_screen.dart';
import 'package:prj_dorm/screens/community/screen/create_community_screen.dart';
import 'package:prj_dorm/screens/home/home_screen.dart';
import 'package:routemaster/routemaster.dart';

final loggedOutRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: SignupScreen()),
});

final loggedInRoute = RouteMap(routes: {
  '/': (_) => const MaterialPage(child: HomeScreen()),
  '/create-community': (_) =>
      const MaterialPage(child: CreateCommunityScreen()),
  '/communities/name': (route) => MaterialPage(
        child: CommunityScreen(
          name: route.pathParameters['name']!,
        ),
      )
});
