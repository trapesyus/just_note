import 'package:flutter/material.dart';
import 'package:just_note/core/constants/color_constants.dart';
import 'package:just_note/initialize/initialize.dart';
import 'package:just_note/screen/home_screen/home_screen.dart';

void main() async {
  await Initialize.initialize();
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
      home: const HomeScreen(),
    );
  }
}
