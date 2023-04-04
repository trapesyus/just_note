// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_note_screen_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddNoteScreenModel on AddNoteScreenModelBase, Store {
  late final _$titleControllerAtom =
      Atom(name: 'AddNoteScreenModelBase.titleController', context: context);

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

  late final _$icerikControllerAtom =
      Atom(name: 'AddNoteScreenModelBase.icerikController', context: context);

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

  late final _$isItalicAtom =
      Atom(name: 'AddNoteScreenModelBase.isItalic', context: context);

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
      Atom(name: 'AddNoteScreenModelBase.isBold', context: context);

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
      Atom(name: 'AddNoteScreenModelBase.fontSize', context: context);

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

  late final _$isUnderlineAtom =
      Atom(name: 'AddNoteScreenModelBase.isUnderline', context: context);

  @override
  bool get isUnderline {
    _$isUnderlineAtom.reportRead();
    return super.isUnderline;
  }

  @override
  set isUnderline(bool value) {
    _$isUnderlineAtom.reportWrite(value, super.isUnderline, () {
      super.isUnderline = value;
    });
  }

  late final _$groupValueFontNameAtom =
      Atom(name: 'AddNoteScreenModelBase.groupValueFontName', context: context);

  @override
  String get groupValueFontName {
    _$groupValueFontNameAtom.reportRead();
    return super.groupValueFontName;
  }

  @override
  set groupValueFontName(String value) {
    _$groupValueFontNameAtom.reportWrite(value, super.groupValueFontName, () {
      super.groupValueFontName = value;
    });
  }

  late final _$dropDownValueAsyncAction =
      AsyncAction('AddNoteScreenModelBase.dropDownValue', context: context);

  @override
  Future<void> dropDownValue(
      {required String value, required BuildContext context}) {
    return _$dropDownValueAsyncAction
        .run(() => super.dropDownValue(value: value, context: context));
  }

  late final _$AddNoteScreenModelBaseActionController =
      ActionController(name: 'AddNoteScreenModelBase', context: context);

  @override
  void isItalicCheck() {
    final _$actionInfo = _$AddNoteScreenModelBaseActionController.startAction(
        name: 'AddNoteScreenModelBase.isItalicCheck');
    try {
      return super.isItalicCheck();
    } finally {
      _$AddNoteScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isBoldCheck() {
    final _$actionInfo = _$AddNoteScreenModelBaseActionController.startAction(
        name: 'AddNoteScreenModelBase.isBoldCheck');
    try {
      return super.isBoldCheck();
    } finally {
      _$AddNoteScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void fontSizeChanger({required bool isFontSize}) {
    final _$actionInfo = _$AddNoteScreenModelBaseActionController.startAction(
        name: 'AddNoteScreenModelBase.fontSizeChanger');
    try {
      return super.fontSizeChanger(isFontSize: isFontSize);
    } finally {
      _$AddNoteScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isUnderlineCheck() {
    final _$actionInfo = _$AddNoteScreenModelBaseActionController.startAction(
        name: 'AddNoteScreenModelBase.isUnderlineCheck');
    try {
      return super.isUnderlineCheck();
    } finally {
      _$AddNoteScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
titleController: ${titleController},
icerikController: ${icerikController},
isItalic: ${isItalic},
isBold: ${isBold},
fontSize: ${fontSize},
isUnderline: ${isUnderline},
groupValueFontName: ${groupValueFontName}
    ''';
  }
}
