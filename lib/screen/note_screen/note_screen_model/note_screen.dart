import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:just_note/core/constants/color_constants.dart';
import 'package:just_note/core/extensions/navigate.extension.dart';
import 'package:just_note/core/extensions/padding_extension.dart';
import 'package:just_note/core/extensions/size_extension.dart';
import 'package:just_note/core/widgets/appbar_widget.dart';
import 'package:just_note/core/widgets/text_widget.dart';
import 'package:just_note/core/widgets/textfield_widget.dart';
import 'package:just_note/screen/home_screen/home_screen.dart';
import 'package:just_note/screen/note_screen/note_screen_model/note_screen_model.dart';

import '../../../core/widgets/icon_button_widget.dart';
import '../../../helper/text_fonts.dart';

class NoteScreen extends StatefulWidget {
  final int id;
  const NoteScreen({super.key, required this.id});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final NoteScreenModel _noteScreenModel = NoteScreenModel();

  Future<void> getNote() async {
    await _noteScreenModel.getNote(index: widget.id);
  }

  @override
  void initState() {
    getNote().whenComplete(() => _noteScreenModel.isLoadingCheck());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton:
            _noteScreenModel.isEdit ? _noteScreenFloatingButton(context) : null,
        appBar: _noteScreenAppBar(context),
        body: _noteScreenModel.isLoading
            ? Column(children: [
                _noteScreenModel.isEdit
                    ? Align(
                        alignment: Alignment.centerRight,
                        child: _addNoteScreenDropDownButton(context: context))
                    : const SizedBox(),
                Expanded(
                    child: _noteScreenCustomTextViewer(context).getPadding(
                        context: context, sizeWidth: 0.02, sizeHeight: 0.02)),
                _noteScreenModel.isEdit
                    ? _noteScreenPaletteContainer(context)
                        .getPaddingOnly(context: context, right: 0.07)
                    : const SizedBox()
              ])
            : const Center(
                child: CircularProgressIndicator(
                    color: ColorConstants.appBarBackGreenColor)),
      );
    });
  }

  Container _noteScreenPaletteContainer(BuildContext context) {
    return Container(
        width: context.getSizeWidth(size: 0.7),
        height: context.getSizeHeight(size: 0.06),
        decoration: const BoxDecoration(
            color: ColorConstants.iconBgColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: _noteScreenPalette());
  }

  SizedBox _noteScreenCustomTextViewer(BuildContext context) {
    return SizedBox(
      width: context.getSizeWidth(size: 1),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: _noteScreenModel.isEdit
            ? CustomTextField(
                isUnderline: _noteScreenModel.isUnderline,
                controller: _noteScreenModel.icerikController,
                isItalic: _noteScreenModel.isItalic,
                isBold: _noteScreenModel.isBold,
                fontSize: _noteScreenModel.fontSize,
              ).getPadding(context: context, sizeWidth: 0.02, sizeHeight: 0)
            : SingleChildScrollView(
                child: CustomText(
                        fontSize: 16,
                        color: Colors.white,
                        text: _noteScreenModel.liste[0].icerik)
                    .getPadding(
                        context: context, sizeWidth: 0.02, sizeHeight: 0),
              ),
      ),
    );
  }

  CustomAppBar _noteScreenAppBar(BuildContext context) {
    return CustomAppBar(
        backgroundColor: ColorConstants.iconBgColor,
        actions: [
          IconButton(
              onPressed: () async {
                _noteScreenModel.isEditCheck();
                if (_noteScreenModel.isEdit == true) return;
                await _noteScreenModel.getUpdate(
                    context: context, id: widget.id);
              },
              icon: _noteScreenModel.isEdit
                  ? const Icon(Icons.check)
                  : const Icon(Icons.edit))
        ],
        title:
            _noteScreenModel.isLoading ? _noteScreenModel.liste[0].title : '',
        titleStyle: true,
        centerTitle: false,
        leading: IconButton(
            onPressed: () =>
                const HomeScreen().navigateToBack(context: context),
            icon: const Icon(Icons.arrow_back_ios_new)));
  }

  FloatingActionButton _noteScreenFloatingButton(BuildContext context) {
    return FloatingActionButton(
        onPressed: () async =>
            await _noteScreenModel.getDelete(id: widget.id, context: context),
        child: const Icon(Icons.delete));
  }

  Row _noteScreenPalette() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomIconButton(
              icon: const Icon(Icons.format_italic),
              onPressed: () => _noteScreenModel.isItalicCheck()),
          CustomIconButton(
              icon: const Icon(Icons.format_bold),
              onPressed: () => _noteScreenModel.isBoldCheck()),
          CustomIconButton(
              icon: const Icon(Icons.format_underline),
              onPressed: () => _noteScreenModel.isUnderlineCheck()),
          Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                CustomIconButton(
                    icon: const Icon(Icons.arrow_drop_up, size: 30),
                    onPressed: () =>
                        _noteScreenModel.fontSizeChanger(isFontSize: true),
                    color: ColorConstants.whiteColor),
                CustomText(
                    text: _noteScreenModel.fontSize.toInt().toString(),
                    color: ColorConstants.whiteColor),
                CustomIconButton(
                    icon: const Icon(Icons.arrow_drop_down, size: 30),
                    onPressed: () =>
                        _noteScreenModel.fontSizeChanger(isFontSize: false),
                    color: ColorConstants.whiteColor),
              ],
            ),
          )
        ],
      );
  DropdownButton<String> _addNoteScreenDropDownButton(
      {required BuildContext context}) {
    return DropdownButton(
      alignment: Alignment.center,
      elevation: 0,
      icon: const Icon(Icons.font_download),
      dropdownColor: ColorConstants.appBarBackGreenColor,
      value: _noteScreenModel.groupValueFontName,
      isExpanded: false,
      items: TextFonts.fontChoiceDropDownItems.map((String items) {
        return _addNoteScreenDropDownMenuItem(items);
      }).toList(),
      onChanged: (String? value) async {
        await _noteScreenModel.dropDownValue(
            value: value!, id: widget.id, context: context);
      },
    );
  }

  DropdownMenuItem<String> _addNoteScreenDropDownMenuItem(String items) {
    return DropdownMenuItem(
        value: items,
        child: CustomText(
          text: items,
          color: Colors.white,
        ));
  }
}
