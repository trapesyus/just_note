import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';

class TextFonts {
  static final Map<String, dynamic> fontChoice = {
    'Roboto_regular': GoogleFonts.roboto().fontFamily,
    'Inter_regular': GoogleFonts.inter().fontFamily,
    'Oswald_regular': GoogleFonts.oswald().fontFamily,
    'Ubuntu_regular': GoogleFonts.ubuntu().fontFamily,
    'Karla_regular': GoogleFonts.karla().fontFamily,
    'OpenSans_regular': GoogleFonts.openSans().fontFamily,
    'Inconsolata_regular': GoogleFonts.inconsolata().fontFamily,
    'Dosis_regular': GoogleFonts.dosis().fontFamily,
    'CrimsonText_regular': GoogleFonts.crimsonText().fontFamily,
    'CormorantGaramond_regular': GoogleFonts.cormorantGaramond().fontFamily,
    'Tillana_regular': GoogleFonts.tillana().fontFamily,
    'GloriaHallelujah_regular': GoogleFonts.gloriaHallelujah().fontFamily,
    'IrishGrover_regular': GoogleFonts.irishGrover().fontFamily,
    'Oregano_regular': GoogleFonts.oregano().fontFamily,
  };
  @observable
  static final List<String> fontChoiceDropDownItems = [
    'Roboto_regular',
    'Inter_regular',
    'Oswald_regular',
    'Ubuntu_regular',
    'OpenSans_regular',
    'Karla_regular',
    'Inconsolata_regular',
    'Dosis_regular',
    'CrimsonText_regular',
    'CormorantGaramond_regular',
    'Tillana_regular',
    'GloriaHallelujah_regular',
    'IrishGrover_regular',
    'Oregano_regular',
  ];
}
