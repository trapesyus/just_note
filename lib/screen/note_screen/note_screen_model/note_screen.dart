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
                Expanded(
                    child: _noteScreenCustomTextViewer(context).getPadding(
                        context: context, sizeWidth: 0.02, sizeHeight: 0.02)),
                _noteScreenModel.isEdit
                    ? _noteScreenPaletteContainer(context)
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
        width: context.getSizeWidth(size: 0.61),
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
        color: ColorConstants.iconBgColor,
        elevation: 0,
        child: _noteScreenModel.isEdit
            ? CustomTextField(
                controller: _noteScreenModel.icerikController,
                isItalic: _noteScreenModel.isItalic,
                isBold: _noteScreenModel.isBold,
                fontSize: _noteScreenModel.fontSize,
              ).getPadding(context: context, sizeWidth: 0.02, sizeHeight: 0)
            : CustomText(
                    color: Colors.white,
                    text:
                        ' ${_noteScreenModel.liste[0].title}\n${_noteScreenModel.liste[0].icerik}')
                .getPadding(context: context, sizeWidth: 0.02, sizeHeight: 0),
      ),
    );
  }

  CustomAppBar _noteScreenAppBar(BuildContext context) {
    return CustomAppBar(
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
          Container(
            decoration: BoxDecoration(
                color: ColorConstants.textFieldHintText,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                CustomIconButton(
                    icon: const Icon(Icons.arrow_drop_up, size: 30),
                    onPressed: () =>
                        _noteScreenModel.fontSizeChanger(isFontSize: true),
                    color: Colors.deepPurple),
                Text(_noteScreenModel.fontSize.toInt().toString()),
                CustomIconButton(
                    icon: const Icon(Icons.arrow_drop_down, size: 30),
                    onPressed: () =>
                        _noteScreenModel.fontSizeChanger(isFontSize: false),
                    color: Colors.deepPurple)
              ],
            ),
          )
        ],
      );
}
