import 'package:flutter/material.dart';
import 'package:just_note/core/extensions/navigate.extension.dart';
import 'package:just_note/core/extensions/snackbar_extension.dart';
import 'package:just_note/helper/language/language_service.dart';
import 'package:just_note/helper/preferences.dart';
import 'package:just_note/screen/splash_screen/splash_screen.dart';
import 'package:just_note/service/database/note_database.dart';
import 'package:just_note/service/model/note_model.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'home_screen_model.g.dart';

class HomeScreenModel = HomeScreenModelBase with _$HomeScreenModel;

abstract class HomeScreenModelBase with Store {
  @observable
  List<NoteDatabaseModel> notes = ObservableList<NoteDatabaseModel>.of([]);
  @observable
  bool isLoading = false;
  @observable
  bool isFavCheck = false;
  @observable
  TextEditingController searchController = TextEditingController();
  @observable
  List<NoteDatabaseModel> searchList = ObservableList<NoteDatabaseModel>.of([]);
  @observable
  String languageDropDownValue =
      LanguageService.choosenLanguage['key'].ingilizce;
  @action
  void isLoadingCheck() {
    isLoading = !isLoading;
  }

  Future<void> searchQuery() async {
    searchList.clear();
    await getNoteList();
    for (var element in notes) {
      if (element.icerik.contains(searchController.value.text)) {
        searchList.add(element);
      }
    }
  }

  Future<void> languageDropDownButton(
      {required String value, required BuildContext context}) async {
    final SharedPreferences preferences = await Preferences.prefs;
    languageDropDownValue = value;
    if (languageDropDownValue == 'Türkçe' ||
        languageDropDownValue == 'Turkish') {
      await preferences.setString('language', 'tr').whenComplete(() =>
          const SplashScreen().navigateToPushReplacement(context: context));
    } else {
      await preferences.setString('language', 'en').whenComplete(() =>
          const SplashScreen().navigateToPushReplacement(context: context));
    }
  }

  Future<void> isFavUpdate(
      {required int id, required BuildContext context}) async {
    NoteDatabaseService noteDatabaseService = NoteDatabaseService();
    List<NoteDatabaseModel> tempList =
        await noteDatabaseService.queryRowCount(id);

    NoteDatabaseModel tempValue = NoteDatabaseModel(
        id: id,
        title: tempList[0].title,
        icerik: tempList[0].icerik,
        date: tempList[0].date,
        isFav: tempList[0].isFav == 0 ? 1 : 0);
    await noteDatabaseService.updateRow(id, tempValue).whenComplete(() {
      const SplashScreen().navigateToPushReplacement(context: context);
      tempList[0].isFav == 0
          ? context.snackBarExtension(
              content: '${tempList[0].title} Başlıklı not favorilere eklendi.')
          : context.snackBarExtension(
              content:
                  '${tempList[0].title} Başlıklı not favorilerden çıkarıldı.');
    });
  }

  @action
  Future<void> getNoteList() async {
    NoteDatabaseService noteDatabaseService = NoteDatabaseService();
    notes.clear();
    notes.addAll(await noteDatabaseService.retrieveTable());
  }
}
