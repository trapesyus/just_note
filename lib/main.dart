import 'package:flutter/material.dart';
import 'package:just_note/core/constants/color_constants.dart';
import 'package:just_note/screen/splash_screen/splash_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Just Note',
      theme: ThemeData(
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: ColorConstants.iconBgColor),
          iconButtonTheme: IconButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStateColor.resolveWith(
                      (states) => ColorConstants.iconBgColor))),
          scaffoldBackgroundColor: ColorConstants.appBarBackGreenColor),
      home: const SplashScreen(),
    );
  }
}
