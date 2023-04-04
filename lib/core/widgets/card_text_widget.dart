import 'package:flutter/material.dart';

import '../../helper/preferences.dart';
import '../../helper/text_fonts.dart';

// ignore: must_be_immutable
class CustomCardText extends StatelessWidget {
  CustomCardText({super.key, required this.text, this.overFlow = true});
  String text;
  bool? overFlow;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(fontFamily: TextFonts.fontChoice[Preferences.fontName]),
      overflow: overFlow! ? TextOverflow.ellipsis : null,
      maxLines: 4,
    );
  }
}
