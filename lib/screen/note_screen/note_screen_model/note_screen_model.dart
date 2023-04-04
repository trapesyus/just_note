import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:just_note/core/extensions/navigate.extension.dart';
import 'package:just_note/core/extensions/snackbar_extension.dart';
import 'package:just_note/screen/splash_screen/splash_screen.dart';
import 'package:just_note/service/model/note_model.dart';
import 'package:mobx/mobx.dart';

import '../../../helper/preferences.dart';
import '../../../helper/text_fonts.dart';
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
  @observable
  bool isItalic = false;
  @observable
  bool isBold = false;
  @observable
  double fontSize = 16;
  @observable
  bool isUnderline = false;
  @observable
  String groupValueFontName = TextFonts.fontChoice[Preferences.fontName];
  @action
  void isItalicCheck() {
    isItalic = !isItalic;
  }

  @action
  void isBoldCheck() {
    isBold = !isBold;
  }

  @action
  void fontSizeChanger({required bool isFontSize}) {
    if (isFontSize == true) {
      fontSize += 1;
    } else {
      fontSize -= 1;
    }
  }

  void isEditCheck() async {
    isEdit = !isEdit;
  }

  @action
  void isLoadingCheck() {
    isLoading = !isLoading;
  }

  @action
  void isUnderlineCheck() {
    isUnderline = !isUnderline;
  }

  final NoteDatabaseService noteDatabaseService = NoteDatabaseService();
  @action
  Future<void> getNote({required int index}) async {
    liste.addAll(await noteDatabaseService.queryRowCount(index));
    TextEditingController title = TextEditingController(text: liste[0].title);
    TextEditingController icerik = TextEditingController(text: liste[0].icerik);
    titleController.text = title.value.text;
    icerikController.text = icerik.value.text;
  }

  @action
  Future<void> dropDownValue(
      {required String value, required BuildContext context}) async {
    groupValueFontName = value;
    await setFont(fontName: groupValueFontName, context: context);
  }

  @action
  Future<void> setFont(
      {required String fontName, required BuildContext context}) async {
    await Preferences.setPreferences(fontFamily: fontName).whenComplete(
        () => const SplashScreen().navigateToPushReplacement(context: context));
  }

  @action
  Future<void> getUpdate(
      {required int id, required BuildContext context}) async {
    NoteDatabaseModel item = NoteDatabaseModel(
        id: id,
        title: titleController.text,
        icerik: icerikController.text,
        date: DateFormat('yyyy-MM-dd - kk:mm').format(DateTime.now()));
    await noteDatabaseService.updateRow(id, item).whenComplete(() {
      const SplashScreen().navigateToPushReplacement(context: context);
      context.snackBarExtension(content: 'Not Başarıyla Güncellendi');
    });
  }

  @action
  Future<void> getDelete(
      {required int id, required BuildContext context}) async {
    await noteDatabaseService.deleteRow(id).whenComplete(() {
      const SplashScreen().navigateToPushReplacement(context: context);
      context.snackBarExtension(content: 'Silme İşlemi Başarıyla Gerçekleşti');
    });
  }
}
