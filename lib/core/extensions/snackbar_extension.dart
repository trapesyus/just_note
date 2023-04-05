import 'package:just_note/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:just_note/core/widgets/text_widget.dart';

extension SnackBarExtension on BuildContext {
  snackBarExtension({required String content}) =>
      ScaffoldMessenger.of(this).showSnackBar(SnackBar(
        content: Center(
            child: CustomText(
          text: content,
          color: Colors.white,
        )),
        backgroundColor: ColorConstants.iconBgColor,
        duration: const Duration(seconds: 2),
        elevation: 0,
        shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      ));
}
