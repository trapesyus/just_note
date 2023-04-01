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

  late final _$isItalicAtom =
      Atom(name: 'NoteScreenModelBase.isItalic', context: context);

  @override
  bool get isItalic {
    _$isItalicAtom.reportRead();
    return super.isItalic;
  }

  @override
  set isItalic(bool value) {
    _$isItalicAtom.reportWrite(value, super.isItalic, () {
      super.isItalic = value;
    });
  }

  late final _$isBoldAtom =
      Atom(name: 'NoteScreenModelBase.isBold', context: context);

  @override
  bool get isBold {
    _$isBoldAtom.reportRead();
    return super.isBold;
  }

  @override
  set isBold(bool value) {
    _$isBoldAtom.reportWrite(value, super.isBold, () {
      super.isBold = value;
    });
  }

  late final _$fontSizeAtom =
      Atom(name: 'NoteScreenModelBase.fontSize', context: context);

  @override
  double get fontSize {
    _$fontSizeAtom.reportRead();
    return super.fontSize;
  }

  @override
  set fontSize(double value) {
    _$fontSizeAtom.reportWrite(value, super.fontSize, () {
      super.fontSize = value;
    });
  }

  late final _$getNoteAsyncAction =
      AsyncAction('NoteScreenModelBase.getNote', context: context);

  @override
  Future<void> getNote({required int index}) {
    return _$getNoteAsyncAction.run(() => super.getNote(index: index));
  }

  late final _$getUpdateAsyncAction =
      AsyncAction('NoteScreenModelBase.getUpdate', context: context);

  @override
  Future<void> getUpdate({required int id, required BuildContext context}) {
    return _$getUpdateAsyncAction
        .run(() => super.getUpdate(id: id, context: context));
  }

  late final _$getDeleteAsyncAction =
      AsyncAction('NoteScreenModelBase.getDelete', context: context);

  @override
  Future<void> getDelete({required int id, required BuildContext context}) {
    return _$getDeleteAsyncAction
        .run(() => super.getDelete(id: id, context: context));
  }

  late final _$NoteScreenModelBaseActionController =
      ActionController(name: 'NoteScreenModelBase', context: context);

  @override
  void isItalicCheck() {
    final _$actionInfo = _$NoteScreenModelBaseActionController.startAction(
        name: 'NoteScreenModelBase.isItalicCheck');
    try {
      return super.isItalicCheck();
    } finally {
      _$NoteScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isBoldCheck() {
    final _$actionInfo = _$NoteScreenModelBaseActionController.startAction(
        name: 'NoteScreenModelBase.isBoldCheck');
    try {
      return super.isBoldCheck();
    } finally {
      _$NoteScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fontSizeChanger({required bool isFontSize}) {
    final _$actionInfo = _$NoteScreenModelBaseActionController.startAction(
        name: 'NoteScreenModelBase.fontSizeChanger');
    try {
      return super.fontSizeChanger(isFontSize: isFontSize);
    } finally {
      _$NoteScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isLoadingCheck() {
    final _$actionInfo = _$NoteScreenModelBaseActionController.startAction(
        name: 'NoteScreenModelBase.isLoadingCheck');
    try {
      return super.isLoadingCheck();
    } finally {
      _$NoteScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
liste: ${liste},
isLoading: ${isLoading},
isEdit: ${isEdit},
icerikController: ${icerikController},
titleController: ${titleController},
isItalic: ${isItalic},
isBold: ${isBold},
fontSize: ${fontSize}
    ''';
  }
}
