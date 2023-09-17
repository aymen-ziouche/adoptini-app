import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginTheme {
  static TextStyle titleTextStyle = GoogleFonts.leagueSpartan(
    color: Colors.black,
    fontSize: 46,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
  );
  static TextStyle bodyTextSmall = GoogleFonts.leagueSpartan(
    color: AdoptiniColors.accentColor,
    fontSize: 15,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
  );
  static TextStyle buttonText = GoogleFonts.leagueSpartan(
    color: Colors.white,
    fontSize: 21,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.normal,
    letterSpacing: 0,
  );
}
