// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_screen_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NoteScreenModel on NoteScreenModelBase, Store {
  late final _$listeAtom =
      Atom(name: 'NoteScreenModelBase.liste', context: context);

  @override
  List<NoteDatabaseModel> get liste {
    _$listeAtom.reportRead();
    return super.liste;
  }

  @override
  set liste(List<NoteDatabaseModel> value) {
    _$listeAtom.reportWrite(value, super.liste, () {
      super.liste = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'NoteScreenModelBase.isLoading', context: context);

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

  late final _$isEditAtom =
      Atom(name: 'NoteScreenModelBase.isEdit', context: context);

  @override
  bool get isEdit {
    _$isEditAtom.reportRead();
    return super.isEdit;
  }

  @override
  set isEdit(bool value) {
    _$isEditAtom.reportWrite(value, super.isEdit, () {
      super.isEdit = value;
    });
  }

  late final _$icerikControllerAtom =
      Atom(name: 'NoteScreenModelBase.icerikController', context: context);

  @override
  TextEditingController get icerikController {
    _$icerikControllerAtom.reportRead();
    return super.icerikController;
  }

  @override
  set icerikController(TextEditingController value) {
    _$icerikControllerAtom.reportWrite(value, super.icerikController, () {
      super.icerikController = value;
    });
  }

  late final _$titleControllerAtom =
      Atom(name: 'NoteScreenModelBase.titleController', context: context);

  @override
  TextEditingController get titleController {
    _$titleControllerAtom.reportRead();
    return super.titleController;
  }

  @override
  set titleController(TextEditingController value) {
    _$titleControllerAtom.reportWrite(value, super.titleController, () {
      super.titleController = value;
    });
  }

  late final _$getNoteAsyncAction =
      AsyncAction('NoteScreenModelBase.getNote', context: context);

  @override
  Future<void> getNote({required int index}) {
    return _$getNoteAsyncAction.run(() => super.getNote(index: index));
  }

  @override
  String toString() {
    return '''
liste: ${liste},
isLoading: ${isLoading},
isEdit: ${isEdit},
icerikController: ${icerikController},
titleController: ${titleController}
    ''';
  }
}
