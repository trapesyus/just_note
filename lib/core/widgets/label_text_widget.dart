import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

// ignore: must_be_immutable
class CustomLabelText extends StatelessWidget {
  CustomLabelText({super.key, required this.label});
  String label;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.labelMedium?.copyWith(
          color: ColorConstants.titleBlackTextColor,
          fontWeight: FontWeight.bold),
    );
  }
}
