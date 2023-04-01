import 'package:just_note/core/extensions/size_extension.dart';
import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

// ignore: must_be_immutable
class CustomElevatedButton extends StatelessWidget {
  String buttonText;
  Function onPressed;
  CustomElevatedButton(
      {super.key, required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
            fixedSize: Size(context.getSizeWidth(size: 0.8),
                context.getSizeHeight(size: 0.04)),
            backgroundColor: ColorConstants.elevatedButtonBackgroundColor),
        onPressed: () => onPressed(),
        child: Text(buttonText, style: const TextStyle(color: Colors.white)));
  }
}
