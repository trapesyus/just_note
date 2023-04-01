import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:just_note/core/extensions/navigate.extension.dart';
import 'package:just_note/core/extensions/snackbar_extension.dart';
import 'package:just_note/screen/home_screen/home_screen.dart';
import 'package:just_note/service/database/note_database.dart';
import 'package:just_note/service/model/note_model.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:mobx/mobx.dart';
part 'add_note_screen_model.g.dart';

class AddNoteScreenModel = AddNoteScreenModelBase with _$AddNoteScreenModel;

abstract class AddNoteScreenModelBase with Store {
  @observable
  TextEditingController titleController = TextEditingController();
  @observable
  TextEditingController icerikController = TextEditingController();
  @observable
  bool isItalic = false;
  @observable
  bool isBold = false;
  @observable
  double fontSize = 16;

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

  Future<void> addDatabase(
      {required String title,
      required String icerik,
      required BuildContext context}) async {
    if (title.isEmpty || icerik.isEmpty) {
      context.snackBarExtension(content: 'Başlık ya da İçerik Boş Olmamalı');
      return;
    }
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

  Future<void> getGallery({required BuildContext context}) async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;
    if (context.mounted) {
      await textRecognize(image: image.path, context: context);
    }
  }

  Future<void> getCamera({required BuildContext context}) async {
    final ImagePicker picker = ImagePicker();
// Pick an image.
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo == null) return;
    if (context.mounted) {
      await textRecognize(image: photo.path, context: context);
    }
  }

  Future<void> textRecognize(
      {required String image, required BuildContext context}) async {
    TextRecognizer textRecognizer = TextRecognizer();

    final photo = InputImage.fromFilePath(image);
    final text = await textRecognizer.processImage(photo);
    if (text.text.isEmpty) {
      if (context.mounted) {
        context.snackBarExtension(
            content: 'Resimde metin bulunamadı ya da bir hata oluştu');
      }
      return;
    }
    icerikController.text = text.text;
    if (context.mounted) {
      context.snackBarExtension(content: 'Resim başarıyla metne çevrildi.');
    }
  }
  // Future<void> retreive() async {
  //   NoteDatabaseService noteDatabaseService = NoteDatabaseService();
  //   List x = await noteDatabaseService.retrieveTable();
  //   log(x[0].icerik);
  // }
}
