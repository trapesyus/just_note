import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:just_note/core/extensions/navigate.extension.dart';
import 'package:just_note/core/extensions/snackbar_extension.dart';
import 'package:just_note/screen/home_screen/home_screen.dart';
import 'package:just_note/service/database/note_database.dart';
import 'package:just_note/service/model/note_model.dart';
import 'package:mobx/mobx.dart';
part 'add_note_screen_model.g.dart';

class AddNoteScreenModel = _AddNoteScreenModelBase with _$AddNoteScreenModel;

abstract class _AddNoteScreenModelBase with Store {
  @observable
  TextEditingController titleController = TextEditingController();
  @observable
  TextEditingController icerikController = TextEditingController();
  @observable
  bool isItalic = false;
  @observable
  bool isBold = false;

  @action
  void isItalicCheck() {
    isItalic = !isItalic;
  }

  @action
  void isBoldCheck() {
    isBold = !isBold;
  }

  Future<void> addDatabase(
      {required String title,
      required String icerik,
      required BuildContext context}) async {
    NoteDatabaseModel noteModel =
        NoteDatabaseModel(icerik: icerik, title: title);
    await insert(todo: noteModel, context: context);
  }

  Future<void> insert(
      {required NoteDatabaseModel todo, required BuildContext context}) async {
    NoteDatabaseService noteDatabaseService = NoteDatabaseService();
    await noteDatabaseService.insertTable(todo);
    titleController.clear();
    icerikController.clear();
    if (context.mounted) {
      const HomeScreen().navigateToPushReplacement(context: context);
      context.snackBarExtension(content: 'Not Başarıyla Eklendi :)');
    }
  }

  // Future<void> retreive() async {
  //   NoteDatabaseService noteDatabaseService = NoteDatabaseService();
  //   List x = await noteDatabaseService.retrieveTable();
  //   log(x[0].icerik);
  // }
}
