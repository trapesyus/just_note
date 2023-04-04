import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';

class TextFonts {
  static final Map<String, dynamic> fontChoice = {
    'Roboto_regular': GoogleFonts.roboto().fontFamily,
    'OpenSans_regular': GoogleFonts.openSans().fontFamily,
    'Poppins_regular': GoogleFonts.poppins().fontFamily,
    'RobotoMono_regular': GoogleFonts.robotoMono().fontFamily,
    'Sono_regular': GoogleFonts.sono().fontFamily,
    'EduNswActFoundation_regular': GoogleFonts.eduNswActFoundation().fontFamily,
    'Inconsolata_regular': GoogleFonts.inconsolata().fontFamily,
    'Dosis_regular': GoogleFonts.dosis().fontFamily,
    'Rajdhani_regular': GoogleFonts.rajdhani().fontFamily,
    'DancingScript_regular': GoogleFonts.dancingScript().fontFamily,
    'AguafinaScript_regular': GoogleFonts.aguafinaScript().fontFamily
  };
  @observable
  static final List<String> fontChoiceDropDownItems = [
    'Roboto_regular',
    'OpenSans_regular',
    'Poppins_regular',
    'RobotoMono_regular',
    'Sono_regular',
    'EduNswActFoundation_regular',
    'Inconsolata_regular',
    'Dosis_regular',
    'Rajdhani_regular',
    'DancingScript_regular',
    'AguafinaScript_regular'
  ];
}
