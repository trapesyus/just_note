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
  List<NoteDatabaseModel> get notes {
    _$notesAtom.reportRead();
    return super.notes;
  }

  @override
  set notes(List<NoteDatabaseModel> value) {
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

  late final _$isFavCheckAtom =
      Atom(name: 'HomeScreenModelBase.isFavCheck', context: context);

  @override
  bool get isFavCheck {
    _$isFavCheckAtom.reportRead();
    return super.isFavCheck;
  }

  @override
  set isFavCheck(bool value) {
    _$isFavCheckAtom.reportWrite(value, super.isFavCheck, () {
      super.isFavCheck = value;
    });
  }

  late final _$searchControllerAtom =
      Atom(name: 'HomeScreenModelBase.searchController', context: context);

  @override
  TextEditingController get searchController {
    _$searchControllerAtom.reportRead();
    return super.searchController;
  }

  @override
  set searchController(TextEditingController value) {
    _$searchControllerAtom.reportWrite(value, super.searchController, () {
      super.searchController = value;
    });
  }

  late final _$searchListAtom =
      Atom(name: 'HomeScreenModelBase.searchList', context: context);

  @override
  List<NoteDatabaseModel> get searchList {
    _$searchListAtom.reportRead();
    return super.searchList;
  }

  @override
  set searchList(List<NoteDatabaseModel> value) {
    _$searchListAtom.reportWrite(value, super.searchList, () {
      super.searchList = value;
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
  String toString() {
    return '''
notes: ${notes},
isLoading: ${isLoading},
isFavCheck: ${isFavCheck},
searchController: ${searchController},
searchList: ${searchList}
    ''';
  }
}
