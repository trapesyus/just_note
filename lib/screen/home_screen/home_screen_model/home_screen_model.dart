import 'dart:developer';

import 'package:just_note/service/database/note_database.dart';
import 'package:just_note/service/model/note_model.dart';
import 'package:mobx/mobx.dart';
import 'package:sqflite/sqflite.dart';
part 'home_screen_model.g.dart';

class HomeScreenModel = _HomeScreenModelBase with _$HomeScreenModel;

abstract class _HomeScreenModelBase with Store {
  @observable
  ObservableList<NoteDatabaseModel> notes =
      ObservableList<NoteDatabaseModel>.of([]);
  @observable
  bool isLoading = false;
  @observable
  bool isFav = false;

  void isLoadingCheck() {
    isLoading = !isLoading;
  }

  void isFavCheck() {
    isFav = !isFav;
  }

  Future<void> getNoteList() async {
    NoteDatabaseService noteDatabaseService = NoteDatabaseService();
    notes.addAll(await noteDatabaseService.retrieveTable());
    log(notes[1].title);
  }
}
