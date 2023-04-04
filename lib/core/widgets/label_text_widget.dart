import 'package:flutter/material.dart';
import 'package:just_note/helper/preferences.dart';
import 'package:just_note/helper/text_fonts.dart';

import '../constants/color_constants.dart';

// ignore: must_be_immutable
class CustomLabelText extends StatelessWidget {
  CustomLabelText(
      {super.key,
      required this.label,
      this.isColorWhite = false,
      this.color = false});
  final getTextStyle = Preferences.prefs;
  String label;
  bool isColorWhite;
  bool color;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
          fontFamily: TextFonts.fontChoice[Preferences.fontName],
          color: isColorWhite
              ? Colors.white
              : color
                  ? ColorConstants.iconBgColor
                  : ColorConstants.titleBlackTextColor,
          fontWeight: FontWeight.bold),
    );
  }
}
