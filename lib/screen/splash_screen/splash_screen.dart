import 'package:flutter/material.dart';
import 'package:just_note/initialize/initialize.dart';
import 'package:just_note/screen/home_screen/home_screen.dart';
import 'package:just_note/screen/splash_screen/splash_screen_model/splash_screen_model.dart';

import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  final Widget navigateToWidget;
  const SplashScreen({super.key, this.navigateToWidget = const HomeScreen()});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashScreenModel _splashScreenModel = SplashScreenModel();

  @override
  void initState() {
    Initialize.initialize().whenComplete(() async => await _splashScreenModel
        .navigateTo(context: context, navigateToWidget: widget.navigateToWidget)
        .whenComplete(() => null));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(child: Lottie.asset(_splashScreenModel.path, repeat: true)),
        ],
      ),
    );
  }
}
