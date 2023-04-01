// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeScreenModel on HomeScreenModelBase, Store {
  late final _$notesAtom =
      Atom(name: 'HomeScreenModelBase.notes', context: context);

  @override
  ObservableList<NoteDatabaseModel> get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(ObservableList<NoteDatabaseModel> value) {
    _$notesAtom.reportWrite(value, super.notes, () {
      super.notes = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'HomeScreenModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isFavAtom =
      Atom(name: 'HomeScreenModelBase.isFav', context: context);

  @override
  bool get isFav {
    _$isFavAtom.reportRead();
    return super.isFav;
  }

  @override
  set isFav(bool value) {
    _$isFavAtom.reportWrite(value, super.isFav, () {
      super.isFav = value;
    });
  }

  late final _$listViewOneAtom =
      Atom(name: 'HomeScreenModelBase.listViewOne', context: context);

  @override
  ObservableList<NoteDatabaseModel> get listViewOne {
    _$listViewOneAtom.reportRead();
    return super.listViewOne;
  }

  @override
  set listViewOne(ObservableList<NoteDatabaseModel> value) {
    _$listViewOneAtom.reportWrite(value, super.listViewOne, () {
      super.listViewOne = value;
    });
  }

  late final _$listViewTwooAtom =
      Atom(name: 'HomeScreenModelBase.listViewTwoo', context: context);

  @override
  ObservableList<NoteDatabaseModel> get listViewTwoo {
    _$listViewTwooAtom.reportRead();
    return super.listViewTwoo;
  }

  @override
  set listViewTwoo(ObservableList<NoteDatabaseModel> value) {
    _$listViewTwooAtom.reportWrite(value, super.listViewTwoo, () {
      super.listViewTwoo = value;
    });
  }

  late final _$getNoteListAsyncAction =
      AsyncAction('HomeScreenModelBase.getNoteList', context: context);

  @override
  Future<void> getNoteList() {
    return _$getNoteListAsyncAction.run(() => super.getNoteList());
  }

  late final _$HomeScreenModelBaseActionController =
      ActionController(name: 'HomeScreenModelBase', context: context);

  @override
  void isLoadingCheck() {
    final _$actionInfo = _$HomeScreenModelBaseActionController.startAction(
        name: 'HomeScreenModelBase.isLoadingCheck');
    try {
      return super.isLoadingCheck();
    } finally {
      _$HomeScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isFavCheck() {
    final _$actionInfo = _$HomeScreenModelBaseActionController.startAction(
        name: 'HomeScreenModelBase.isFavCheck');
    try {
      return super.isFavCheck();
    } finally {
      _$HomeScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void splitList({required int index}) {
    final _$actionInfo = _$HomeScreenModelBaseActionController.startAction(
        name: 'HomeScreenModelBase.splitList');
    try {
      return super.splitList(index: index);
    } finally {
      _$HomeScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
notes: ${notes},
isLoading: ${isLoading},
isFav: ${isFav},
listViewOne: ${listViewOne},
listViewTwoo: ${listViewTwoo}
    ''';
  }
}
