import 'package:flutter/material.dart';
import 'package:just_note/core/extensions/navigate.extension.dart';
import 'package:mobx/mobx.dart';
part 'splash_screen_model.g.dart';

class SplashScreenModel = SplashScreenModelBase with _$SplashScreenModel;

abstract class SplashScreenModelBase with Store {
  String path = 'assets/lottie/splashLogo.json';

  Future<void> navigateTo(
      {required BuildContext context, required Widget navigateToWidget}) async {
    Future.delayed(const Duration(milliseconds: 2850), () {
      navigateToWidget.navigateToPushReplacement(context: context);
    });
  }
}
