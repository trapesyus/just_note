import 'package:flutter/material.dart';
import 'package:just_note/helper/preferences.dart';

import '../../helper/text_fonts.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  CustomText({super.key, required this.text, this.color = Colors.transparent});
  String text;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: color, fontFamily: TextFonts.fontChoice[Preferences.fontName]),
    );
  }
}
