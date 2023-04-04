import 'package:flutter/material.dart';
import 'package:just_note/helper/preferences.dart';

import '../../helper/text_fonts.dart';
import '../constants/color_constants.dart';

// ignore: must_be_immutable
class CustomTextButton extends StatelessWidget {
  String text;
  Function onPressed;
  Color color;
  CustomTextButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.color = ColorConstants.greenTextColor});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(text,
          style: TextStyle(
              color: color,
              fontFamily: TextFonts.fontChoice[Preferences.fontName])),
      onPressed: () => onPressed(),
    );
  }
}
