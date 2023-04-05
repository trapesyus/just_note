import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:just_note/helper/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'language_model.dart';

class LanguageService {
  static final LanguageModel languageModel = LanguageModel();
  static Map<String, dynamic> choosenLanguage = {'key': LanguageModel().en!};

  Future<void> getLanguage() async {
    SharedPreferences preferences = await Preferences.prefs;
    final Map<String, dynamic> response =
        jsonDecode(await rootBundle.loadString('assets/json/language.json'));
    LanguageModel languageData = LanguageModel.fromJson(response);
    final String language = preferences.getString('language') ?? 'en';
    if (language == 'tr') {
      choosenLanguage = {'key': languageData.tr!};
    } else if (language == 'en') {
      choosenLanguage = {'key': languageData.en!};
    }
  }

  Future<void> setLanguage({required String setLanguage}) async {
    SharedPreferences preferences = await Preferences.prefs;
    await preferences.setString('language', 'setLanguage');
  }
}
