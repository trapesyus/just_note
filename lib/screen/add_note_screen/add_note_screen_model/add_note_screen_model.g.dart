// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_note_screen_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddNoteScreenModel on _AddNoteScreenModelBase, Store {
  late final _$titleControllerAtom =
      Atom(name: '_AddNoteScreenModelBase.titleController', context: context);

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
      Atom(name: '_AddNoteScreenModelBase.icerikController', context: context);

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
      Atom(name: '_AddNoteScreenModelBase.isItalic', context: context);

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
      Atom(name: '_AddNoteScreenModelBase.isBold', context: context);

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

  late final _$_AddNoteScreenModelBaseActionController =
      ActionController(name: '_AddNoteScreenModelBase', context: context);

  @override
  void isItalicCheck() {
    final _$actionInfo = _$_AddNoteScreenModelBaseActionController.startAction(
        name: '_AddNoteScreenModelBase.isItalicCheck');
    try {
      return super.isItalicCheck();
    } finally {
      _$_AddNoteScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void isBoldCheck() {
    final _$actionInfo = _$_AddNoteScreenModelBaseActionController.startAction(
        name: '_AddNoteScreenModelBase.isBoldCheck');
    try {
      return super.isBoldCheck();
    } finally {
      _$_AddNoteScreenModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
titleController: ${titleController},
icerikController: ${icerikController},
isItalic: ${isItalic},
isBold: ${isBold}
    ''';
  }
}
