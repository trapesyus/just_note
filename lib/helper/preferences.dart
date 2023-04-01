import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  static Future<void> getPreferences({TextStyle? fontstyle}) async {
    SharedPreferences preferences = await prefs;
    //   preferences.setBool(
    //       'key', fontstyle ? fontstyle : TextFonts.fontChoice['roboto']);
  }
}
