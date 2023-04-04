import 'package:flutter/material.dart';

import '../../helper/preferences.dart';
import '../../helper/text_fonts.dart';
import '../constants/color_constants.dart';

// ignore: must_be_immutable
class CustomTitleText extends StatelessWidget {
  CustomTitleText({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: ColorConstants.whiteColor,
          fontWeight: FontWeight.bold,
          fontFamily: TextFonts.fontChoice[Preferences.fontName]),
    );
  }
}
