import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:just_note/helper/language/language_service.dart';
import 'package:just_note/helper/preferences.dart';

class Initialize {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Preferences.getPreferences();
    LanguageService languageService = LanguageService();
    await languageService.getLanguage();
    log(LanguageService.choosenLanguage['key'].icerik);
  }
}
