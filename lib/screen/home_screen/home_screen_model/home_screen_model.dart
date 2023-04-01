import 'dart:developer';

import 'package:just_note/service/database/note_database.dart';
import 'package:just_note/service/model/note_model.dart';
import 'package:mobx/mobx.dart';
part 'home_screen_model.g.dart';

class HomeScreenModel = HomeScreenModelBase with _$HomeScreenModel;

abstract class HomeScreenModelBase with Store {
  @observable
  ObservableList<NoteDatabaseModel> notes =
      ObservableList<NoteDatabaseModel>.of([]);
  @observable
  bool isLoading = false;
  @observable
  bool isFav = false;
  @observable
  ObservableList<NoteDatabaseModel> listViewOne =
      ObservableList<NoteDatabaseModel>.of([]);
  @observable
  ObservableList<NoteDatabaseModel> listViewTwoo =
      ObservableList<NoteDatabaseModel>.of([]);
  @action
  void isLoadingCheck() {
    isLoading = !isLoading;
  }

  @action
  void isFavCheck() {
    isFav = !isFav;
  }

  @action
  Future<void> getNoteList() async {
    NoteDatabaseService noteDatabaseService = NoteDatabaseService();
    notes.addAll(await noteDatabaseService.retrieveTable());
    splitList(index: notes.length);
  }

  @action
  void splitList({required int index}) {
    if (index % 2 == 0) {
      listViewOne.clear();
      listViewTwoo.clear();
      //16
      for (int i = 0; i < index / 2; i++) {
        listViewOne.add(notes[i]);
      }
      List<NoteDatabaseModel> temporaryList = [];
      for (int i = index - 1; i >= index / 2; i--) {
        temporaryList.add(notes[i]);
      }
      listViewTwoo.addAll(temporaryList.reversed);
    } else if (index % 2 == 1) {
      listViewOne.clear();
      listViewTwoo.clear();
      for (int i = 0; i < (index + 1) / 2; i++) {
        //// 0 1 2 -- 7
        listViewOne.add(notes[i]);
      }
      List<NoteDatabaseModel> tempList = [];

      for (int i = index - 1; i > (index - 1) / 2; i--) {
        // 14 13 12 110
        tempList.add(notes[i]);
      }
      listViewTwoo.addAll(tempList.reversed);
    }
    log(notes.length.toString() + ' Asıl Liste');
    log(listViewOne.length.toString() + 'liste 1 ');
    log(listViewTwoo.length.toString() + 'liste 2 ');
  }
}
