import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:just_note/core/extensions/navigate.extension.dart';
import 'package:just_note/core/extensions/snackbar_extension.dart';
import 'package:just_note/screen/home_screen/home_screen.dart';
import 'package:just_note/service/model/note_model.dart';
import 'package:mobx/mobx.dart';

import '../../../service/database/note_database.dart';
part 'note_screen_model.g.dart';

class NoteScreenModel = NoteScreenModelBase with _$NoteScreenModel;

abstract class NoteScreenModelBase with Store {
  @observable
  List<NoteDatabaseModel> liste = [];
  @observable
  bool isLoading = false;
  @observable
  bool isEdit = false;

  @observable
  TextEditingController icerikController = TextEditingController();
  @observable
  TextEditingController titleController = TextEditingController();
  String icerik = '';
  String title = '';
  void isEditCheck() async {
    isEdit = !isEdit;
  }

  void isLoadingCheck() {
    isLoading = !isLoading;
  }

  final NoteDatabaseService noteDatabaseService = NoteDatabaseService();
  @action
  Future<void> getNote({required int index}) async {
    liste.addAll(await noteDatabaseService.queryRowCount(index));
  }

  Future<void> getUpdate({required int id}) async {
    if (icerikController.value.text.contains(liste[0].icerik) &&
        titleController.value.text.contains(liste[0].title)) {
      icerikController.text = icerikController.value.text;
      titleController.text = titleController.value.text;
    } else {
      icerikController.text = liste[0].icerik + icerikController.value.text;
      titleController.text = liste[0].title + titleController.value.text;
    }

    NoteDatabaseModel item = NoteDatabaseModel(
        id: id, title: titleController.text, icerik: icerikController.text);
    await noteDatabaseService.updateRow(id, item);
  }

  Future<void> getDelete(
      {required int id, required BuildContext context}) async {
    await noteDatabaseService.deleteRow(id).whenComplete(() {
      const HomeScreen().navigateToPushReplacement(context: context);
      context.snackBarExtension(content: 'Silme İşlemi Başarıyla Gerçekleşti');
    });
  }
}
