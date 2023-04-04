import 'package:flutter/material.dart';
import 'package:just_note/helper/preferences.dart';

class Initialize {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Preferences.getPreferences();
  }
}
