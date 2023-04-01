import 'package:flutter/material.dart';
import 'package:just_note/screen/splash_screen/splash_screen_model/splash_screen_model.dart';

import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashScreenModel _splashScreenModel = SplashScreenModel();
  @override
  void initState() {
    _splashScreenModel.navigateTo(context: context).whenComplete(() => null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Expanded(
              child: Lottie.asset(
            _splashScreenModel.path,
            repeat: true,
          )),
        ],
      ),
    );
  }
}
