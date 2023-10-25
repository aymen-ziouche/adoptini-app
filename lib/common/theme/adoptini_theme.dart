import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:adoptini_app/common/theme/adoptini_colors.dart';

class AdoptiniTheme {
  ThemeData get themeData {
    return ThemeData(
      primaryColor: Colors.lightBlue[800],
      unselectedWidgetColor: Colors.white,
      fontFamily: 'League Spartan',
      textTheme: TextTheme(
        titleLarge: GoogleFonts.leagueSpartan(
          color: Colors.black,
          fontSize: 46,
          fontWeight: FontWeight.bold,
        ),
        bodySmall: GoogleFonts.leagueSpartan(
          color: AdoptiniColors.accentColor,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        labelLarge: GoogleFonts.leagueSpartan(
          color: Colors.white,
          fontSize: 21,
          fontWeight: FontWeight.bold,
        ),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.cyan[600]),
    );
  }
}
