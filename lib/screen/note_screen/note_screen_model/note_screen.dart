import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:just_note/core/constants/color_constants.dart';
import 'package:just_note/core/extensions/navigate.extension.dart';
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
        floatingActionButton: _noteScreenModel.isEdit
            ? FloatingActionButton(
                onPressed: () async => await _noteScreenModel.getDelete(
                    id: widget.id, context: context),
                child: const Icon(Icons.delete))
            : null,
        appBar: CustomAppBar(
            actions: [
              IconButton(
                  onPressed: () async {
                    _noteScreenModel.isEditCheck();
                    if (_noteScreenModel.isEdit == true) return;
                    await _noteScreenModel.getUpdate(id: widget.id);
                  },
                  icon: _noteScreenModel.isEdit
                      ? const Icon(Icons.check)
                      : const Icon(Icons.edit))
            ],
            backgroundColor: ColorConstants.appBarBackGreenColor,
            title: _noteScreenModel.isLoading
                ? _noteScreenModel.liste[0].title
                : '',
            titleStyle: true,
            centerTitle: false,
            leading: IconButton(
                onPressed: () =>
                    const HomeScreen().navigateToBack(context: context),
                icon: const Icon(Icons.arrow_back_ios_new))),
        body: _noteScreenModel.isLoading
            ? Column(children: [
                Expanded(
                    child: SizedBox(
                  width: context.getSizeWidth(size: 1),
                  child: Card(
                    color: ColorConstants.greenTextColor,
                    child: _noteScreenModel.isEdit
                        ? CustomTextField(
                            controller: _noteScreenModel.icerikController,
                          )
                        : CustomText(
                            text:
                                ' ${_noteScreenModel.liste[0].title}\n${_noteScreenModel.liste[0].icerik}'),
                  ),
                ))
              ])
            : const Center(
                child: CircularProgressIndicator(
                    color: ColorConstants.appBarBackGreenColor)),
      );
    });
  }
}
