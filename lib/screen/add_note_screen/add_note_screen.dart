import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:just_note/core/constants/color_constants.dart';
import 'package:just_note/core/extensions/navigate.extension.dart';
import 'package:just_note/core/extensions/padding_extension.dart';
import 'package:just_note/core/extensions/size_extension.dart';
import 'package:just_note/core/widgets/appbar_widget.dart';
import 'package:just_note/core/widgets/elevated_button_widget.dart';
import 'package:just_note/core/widgets/icon_button_widget.dart';
import 'package:just_note/core/widgets/text_widget.dart';
import 'package:just_note/core/widgets/textfield_widget.dart';
import 'package:just_note/screen/add_note_screen/add_note_screen_model/add_note_screen_model.dart';
import 'package:just_note/screen/home_screen/home_screen.dart';

import '../../helper/language/language_service.dart';
import '../../helper/text_fonts.dart';

class AddNoteScreen extends StatelessWidget {
  AddNoteScreen({super.key});
  final AddNoteScreenModel _addNoteScreenModel = AddNoteScreenModel();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _customAppBar(context: context),
        body: Column(
          children: [
            Align(
                alignment: Alignment.centerRight,
                child: _addNoteScreenDropDownButton(context: context)),
            Expanded(child: _customTextFieldTitle()),
            Expanded(flex: 6, child: _customTextFieldContent()),
            _addNoteScreenElevatedButton(context)
                .getPaddingOnly(context: context, bottom: 0.01),
            _addNoteScreenPaletteContainer(context),
          ],
        ),
      );
    });
  }

  Container _addNoteScreenPaletteContainer(BuildContext context) {
    return Container(
      width: context.getSizeWidth(size: 0.7),
      height: context.getSizeHeight(size: 0.06),
      decoration: const BoxDecoration(
          color: ColorConstants.iconBgColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: _addNoteScreenPalette(),
    );
  }

  CustomElevatedButton _addNoteScreenElevatedButton(BuildContext context) {
    return CustomElevatedButton(
        buttonText: 'Ekle',
        onPressed: () async => await _addNoteScreenModel.addDatabase(
            context: context,
            title: _addNoteScreenModel.titleController.value.text,
            icerik: _addNoteScreenModel.icerikController.value.text));
  }

  Row _addNoteScreenPalette() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
              icon: const Icon(Icons.format_italic),
              onPressed: () => _addNoteScreenModel.isItalicCheck()),
          CustomIconButton(
              icon: const Icon(Icons.format_bold),
              onPressed: () => _addNoteScreenModel.isBoldCheck()),
          CustomIconButton(
              icon: const Icon(Icons.format_underline),
              onPressed: () => _addNoteScreenModel.isUnderlineCheck()),
          Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                CustomIconButton(
                    icon: const Icon(Icons.arrow_drop_up, size: 30),
                    onPressed: () =>
                        _addNoteScreenModel.fontSizeChanger(isFontSize: true),
                    color: ColorConstants.whiteColor),
                CustomText(
                    fontSize: 16,
                    text: _addNoteScreenModel.fontSize.toInt().toString(),
                    color: ColorConstants.whiteColor),
                CustomIconButton(
                    icon: const Icon(Icons.arrow_drop_down, size: 30),
                    onPressed: () =>
                        _addNoteScreenModel.fontSizeChanger(isFontSize: false),
                    color: ColorConstants.whiteColor),
              ],
            ),
          )
        ],
      );

  CustomAppBar _customAppBar({required BuildContext context}) => CustomAppBar(
          title: LanguageService.choosenLanguage['key'].notEkle,
          backgroundColor: ColorConstants.appBarBackGreenColor,
          titleStyle: true,
          centerTitle: false,
          leading: Row(
            children: [
              IconButton(
                  onPressed: () =>
                      const HomeScreen().navigateToBack(context: context),
                  icon: const Icon(Icons.arrow_back_ios_new)),
            ],
          ),
          actions: [
            CustomIconButton(
                icon: const Icon(Icons.add_a_photo),
                onPressed: () async =>
                    await _addNoteScreenModel.getCamera(context: context)),
            CustomIconButton(
                icon: const Icon(Icons.photo_rounded),
                onPressed: () async =>
                    await _addNoteScreenModel.getGallery(context: context))
          ]);

  DropdownButton<String> _addNoteScreenDropDownButton(
      {required BuildContext context}) {
    return DropdownButton(
      alignment: Alignment.center,
      elevation: 0,
      icon: const Icon(Icons.font_download),
      dropdownColor: ColorConstants.appBarBackGreenColor,
      value: _addNoteScreenModel.groupValueFontName,
      isExpanded: false,
      items: TextFonts.fontChoiceDropDownItems.map((String items) {
        return _addNoteScreenDropDownMenuItem(items);
      }).toList(),
      onChanged: (String? value) async {
        await _addNoteScreenModel.dropDownValue(
            value: value!, context: context);
      },
    );
  }

  DropdownMenuItem<String> _addNoteScreenDropDownMenuItem(String items) {
    return DropdownMenuItem(
        value: items, child: CustomText(text: items, color: Colors.white));
  }

  CustomTextField _customTextFieldTitle() => CustomTextField(
        sizeLeft: 0.25,
        sizeRight: 0.25,
        isBold: _addNoteScreenModel.isBold,
        isItalic: _addNoteScreenModel.isItalic,
        label: LanguageService.choosenLanguage['key'].baslik,
        isUnderline: false,
        controller: _addNoteScreenModel.titleController,
        labelStyle: true,
        textAlignCenter: true,
        fontSize: _addNoteScreenModel.fontSize,
        sizeTop: 0.02,
        verticalHeight: 0.01,
        horizontalHeight: 0.02,
      );
  CustomTextField _customTextFieldContent() => CustomTextField(
      label: LanguageService.choosenLanguage['key'].icerik,
      controller: _addNoteScreenModel.icerikController,
      labelStyle: true,
      isUnderline: _addNoteScreenModel.isUnderline,
      isItalic: _addNoteScreenModel.isItalic,
      isBold: _addNoteScreenModel.isBold,
      fontSize: _addNoteScreenModel.fontSize,
      sizeLeft: 0.02,
      sizeRight: 0.02,
      verticalHeight: 0,
      horizontalHeight: 0.02);
}
