import 'package:just_note/core/constants/color_constants.dart';
import 'package:just_note/core/widgets/label_text_widget.dart';
import 'package:flutter/material.dart';

extension SnackBarExtension on BuildContext {
  snackBarExtension({required String content}) =>
      ScaffoldMessenger.of(this).showSnackBar(SnackBar(
        content: Center(child: CustomLabelText(label: content)),
        backgroundColor: ColorConstants.iconBgColor,
        duration: const Duration(seconds: 2),
        elevation: 0,
        shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      ));
}
