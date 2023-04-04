import 'package:just_note/helper/text_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static String fontName = TextFonts.fontChoice['Roboto_regular'];
  static Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  static Future<void> setPreferences({required String fontFamily}) async {
    final SharedPreferences preferences = await prefs;
    preferences.setString('font', fontFamily);
  }

  static Future<void> getPreferences() async {
    final SharedPreferences preferences = await prefs;
    final String font = preferences.getString('font') ?? 'Roboto_regular';
    String fontChoice = TextFonts.fontChoice[font];
    fontName = fontChoice;
  }
}
