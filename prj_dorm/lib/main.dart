import 'package:flutter/material.dart';
import 'package:prj_dorm/responsive/mobile_screen_layout.dart';
import 'package:prj_dorm/responsive/responsive_layout_screen.dart';
import 'package:prj_dorm/responsive/web_screen_layout.dart';
import 'package:prj_dorm/util/colors.dart';

void main() {
  runApp(const MyApp());
}

//stful vs stless ?

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
      home: const ResponsiveLayout(
          mobileScreenLayout: MobileScreenLayout(),
          webScreenLayout: WebScreenLayout()),
    );
  }
}
