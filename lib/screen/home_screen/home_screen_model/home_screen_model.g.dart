// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_screen_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeScreenModel on _HomeScreenModelBase, Store {
  late final _$notesAtom =
      Atom(name: '_HomeScreenModelBase.notes', context: context);

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
      Atom(name: '_HomeScreenModelBase.isLoading', context: context);

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
      Atom(name: '_HomeScreenModelBase.isFav', context: context);

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

  @override
  String toString() {
    return '''
notes: ${notes},
isLoading: ${isLoading},
isFav: ${isFav}
    ''';
  }
}
