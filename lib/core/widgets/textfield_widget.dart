// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:just_note/core/extensions/size_extension.dart';

import '../../helper/preferences.dart';
import '../../helper/text_fonts.dart';
import '../constants/color_constants.dart';

class CustomTextField extends StatelessWidget {
  String? hintText;
  String? suffixText;
  String? label;

  Function? isIconOnTap;
  bool isIconTap;
  bool isIcon;
  bool isItalic;
  bool labelStyle;
  bool fillColor;
  bool suffixStyle;
  bool hintTextStyle;
  bool passwordType;
  bool isBold;
  bool isUnderline;
  double fontSize;
  double sizeTop;
  double sizeBottom;
  double sizeLeft;
  double sizeRight;
  bool textAlignCenter;
  double verticalHeight;
  double horizontalHeight;
  TextEditingController? controller;

  CustomTextField(
      {super.key,
      this.isIconTap = false,
      this.isIconOnTap,
      this.isIcon = false,
      this.isUnderline = false,
      this.fontSize = 16,
      this.isBold = false,
      this.isItalic = false,
      this.passwordType = false,
      this.controller,
      this.fillColor = false,
      this.hintText,
      this.hintTextStyle = false,
      this.suffixStyle = false,
      this.suffixText,
      this.label,
      this.labelStyle = false,
      this.sizeBottom = 0.016,
      this.sizeLeft = 0,
      this.sizeRight = 0,
      this.sizeTop = 0,
      this.textAlignCenter = false,
      this.verticalHeight = 0.05,
      this.horizontalHeight = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            top: context.getSizeHeight(size: sizeTop),
            bottom: context.getSizeHeight(size: sizeBottom),
            left: context.getSizeWidth(size: sizeLeft),
            right: context.getSizeWidth(size: sizeRight)),
        child: TextField(
          style: TextStyle(
              color: Colors.white,
              fontFamily: TextFonts.fontChoice[Preferences.fontName],
              fontSize: fontSize,
              decoration: isUnderline ? TextDecoration.underline : null,
              fontStyle: isItalic ? FontStyle.italic : FontStyle.normal,
              fontWeight: isBold ? FontWeight.bold : FontWeight.w500),
          scrollPhysics: const BouncingScrollPhysics(),
          textAlign: textAlignCenter ? TextAlign.center : TextAlign.start,
          textAlignVertical: TextAlignVertical.top,
          controller: controller,
          obscureText: passwordType ? true : false,
          cursorColor: ColorConstants.whiteColor,
          maxLines: null,
          onChanged: isIconTap ? (value) => isIconOnTap!() : (value) => () {},
          keyboardType: TextInputType.multiline,
          decoration: InputDecoration(
              suffixIcon: isIcon
                  ? IconButton(
                      onPressed: () => isIconOnTap!() ?? () {},
                      icon: const Icon(Icons.search),
                      color: ColorConstants.whiteColor,
                    )
                  : null,
              focusedBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: ColorConstants.iconBgColor)),
              enabledBorder: const OutlineInputBorder(
                  borderSide:
                      BorderSide(width: 1, color: ColorConstants.iconBgColor)),
              contentPadding: EdgeInsets.only(
                top: 10,
                left: context.getSizeWidth(size: horizontalHeight),
                right: context.getSizeWidth(size: horizontalHeight),
                bottom: context.getSizeHeight(size: verticalHeight),
              ),
              alignLabelWithHint: false,
              labelText: label ?? '',
              labelStyle: labelStyle
                  ? TextStyle(
                      color: ColorConstants.textFieldHintText,
                      fontFamily: TextFonts.fontChoice[Preferences.fontName])
                  : null,
              suffixText: suffixText ?? '',
              suffixStyle: TextStyle(
                  color: ColorConstants.textFieldHintTextColor,
                  fontFamily: TextFonts.fontChoice[Preferences.fontName]),
              hintStyle: hintTextStyle
                  ? TextStyle(
                      color: ColorConstants.textFieldHintText,
                      fontFamily: TextFonts.fontChoice[Preferences.fontName])
                  : null,
              hintText: hintText ?? '',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                      width: 1, color: ColorConstants.textFieldHintText)),
              fillColor:
                  fillColor ? ColorConstants.textFieldBackgroundColor : null),
        ));
  }
}
