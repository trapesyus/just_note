import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:just_note/core/constants/color_constants.dart';
import 'package:just_note/core/extensions/navigate.extension.dart';
import 'package:just_note/core/extensions/size_extension.dart';
import 'package:just_note/core/widgets/appbar_widget.dart';
import 'package:just_note/core/widgets/icon_button_widget.dart';
import 'package:just_note/core/widgets/textfield_widget.dart';
import 'package:just_note/screen/add_note_screen/add_note_screen_model/add_note_screen_model.dart';
import 'package:just_note/screen/home_screen/home_screen.dart';

class AddNoteScreen extends StatelessWidget {
  AddNoteScreen({super.key});
  final AddNoteScreenModel _addNoteScreenModel = AddNoteScreenModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _customAppBar(context: context),
      floatingActionButton: _addNoteFloatingButton(context: context),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      body: Observer(builder: (context) {
        return Column(
          children: [
            Expanded(child: _customTextFieldTitle()),
            Expanded(flex: 6, child: _customTextFieldContent()),
            Container(
              width: context.getSizeWidth(size: 0.7),
              height: context.getSizeHeight(size: 0.06),
              decoration: const BoxDecoration(
                  color: ColorConstants.iconBgColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: _addNoteScreenPalette(),
            )
          ],
        );
      }),
    );
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
              icon: const Icon(Icons.format_underline), onPressed: () {}),
          Container(
            decoration: BoxDecoration(
                color: ColorConstants.textFieldHintText,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                CustomIconButton(
                    icon: const Icon(Icons.arrow_drop_up, size: 30),
                    onPressed: () =>
                        _addNoteScreenModel.fontSizeChanger(isFontSize: true),
                    color: Colors.deepPurple),
                Text(_addNoteScreenModel.fontSize.toInt().toString()),
                CustomIconButton(
                    icon: const Icon(Icons.arrow_drop_down, size: 30),
                    onPressed: () =>
                        _addNoteScreenModel.fontSizeChanger(isFontSize: false),
                    color: Colors.deepPurple)
              ],
            ),
          )
        ],
      );

  CustomAppBar _customAppBar({required BuildContext context}) => CustomAppBar(
          title: 'Not Ekle',
          titleStyle: true,
          backgroundColor: ColorConstants.appBarBackGreenColor,
          centerTitle: false,
          leading: IconButton(
              onPressed: () =>
                  const HomeScreen().navigateToBack(context: context),
              icon: const Icon(Icons.arrow_back_ios_new)),
          actions: [
            IconButton(
                onPressed: () async =>
                    await _addNoteScreenModel.getCamera(context: context),
                icon: const Icon(Icons.add_a_photo)),
            IconButton(
                onPressed: () async =>
                    await _addNoteScreenModel.getGallery(context: context),
                icon: const Icon(Icons.photo_rounded))
          ]);

  FloatingActionButton _addNoteFloatingButton(
          {required BuildContext context}) =>
      FloatingActionButton(
        onPressed: () async => await _addNoteScreenModel.addDatabase(
            context: context,
            title: _addNoteScreenModel.titleController.value.text,
            icerik: _addNoteScreenModel.icerikController.value.text),
        backgroundColor: ColorConstants.appBarBackGreenColor,
        child: const Icon(Icons.task_alt_rounded),
      );
  CustomTextField _customTextFieldTitle() => CustomTextField(
        sizeLeft: 0.25,
        sizeRight: 0.25,
        isBold: _addNoteScreenModel.isBold,
        isItalic: _addNoteScreenModel.isItalic,
        label: 'Başlık',
        controller: _addNoteScreenModel.titleController,
        labelStyle: true,
        textAlignCenter: true,
        fontSize: _addNoteScreenModel.fontSize,
        sizeTop: 0.02,
        verticalHeight: 0.01,
      );
  CustomTextField _customTextFieldContent() => CustomTextField(
      label: 'İçerik',
      controller: _addNoteScreenModel.icerikController,
      labelStyle: true,
      isItalic: _addNoteScreenModel.isItalic,
      isBold: _addNoteScreenModel.isBold,
      fontSize: _addNoteScreenModel.fontSize,
      sizeLeft: 0.02,
      sizeRight: 0.02,
      verticalHeight: 0,
      horizontalHeight: 0.02);
}
