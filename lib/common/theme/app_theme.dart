
import 'package:flutter/material.dart';

class AppTheme with ChangeNotifier {
  static bool _isDark = true;

  ThemeMode currentTheme() {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme() {
    _isDark = !_isDark;
    notifyListeners();
  }

  void setThemeMode({isDark = true}) {
    _isDark = isDark;
  }

  ThemeData get lightTheme {
    return ThemeData(
      /// Colors
      primaryColor: Colors.lightBlue[800],

      unselectedWidgetColor: Colors.white,

      /// Font family for theme
      fontFamily: 'League Spartan',

      /// Types of different text styles
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontWeight: FontWeight.w500, decoration: TextDecoration.none, color: Colors.black),
        bodyMedium: TextStyle(fontWeight: FontWeight.w500, decoration: TextDecoration.none, color: Colors.black),
        labelLarge: TextStyle(fontWeight: FontWeight.w500, fontSize: 46, color: Colors.black),
        labelSmall: TextStyle(fontWeight: FontWeight.w500, decoration: TextDecoration.none, color: Colors.black),
        displayLarge: TextStyle(fontWeight: FontWeight.w500, decoration: TextDecoration.none, color: Colors.black),
        displayMedium:
            TextStyle(fontWeight: FontWeight.w500, decoration: TextDecoration.none, color: Colors.black),
        displaySmall: TextStyle(fontWeight: FontWeight.w500, decoration: TextDecoration.none, color: Colors.black),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.cyan[600]),
    );
  }

  // ThemeData get darkTheme {
  //   return ThemeData(
  //     /// Colors
  //     primaryColor: Colors.black,

  //     iconTheme: const IconThemeData(
  //       color: DevelColors.white,
  //     ),
  //     primaryIconTheme: const IconThemeData(
  //       color: DevelColors.white,
  //     ),

  //     unselectedWidgetColor: Colors.white,

  //     textButtonTheme: TextButtonThemeData(
  //       style: ButtonStyle(
  //         padding: MaterialStateProperty.all(EdgeInsets.zero),
  //       ),
  //     ),

  //     /// Font family for theme
  //     fontFamily: 'Inter',

  //     /// Types of different text styles
  //     textTheme: const TextTheme(
  //       bodyLarge: TextStyle(fontWeight: FontWeight.w500, decoration: TextDecoration.none, color: Colors.white),
  //       bodyMedium: TextStyle(fontWeight: FontWeight.w500, decoration: TextDecoration.none, color: Colors.white),
  //       labelLarge: TextStyle(fontWeight: FontWeight.w500, decoration: TextDecoration.none, color: Colors.white),
  //       labelSmall: TextStyle(fontWeight: FontWeight.w500, decoration: TextDecoration.none, color: Colors.white),
  //       displayLarge: TextStyle(fontWeight: FontWeight.w500, decoration: TextDecoration.none, color: Colors.white),
  //       displayMedium: TextStyle(fontWeight: FontWeight.w500, decoration: TextDecoration.none, color: Colors.white),
  //       displaySmall: TextStyle(fontWeight: FontWeight.w500, decoration: TextDecoration.none, color: Colors.white),
  //     ),

  //     inputDecorationTheme: const InputDecorationTheme(
  //       focusColor: DevelColors.white,
  //       focusedBorder: UnderlineInputBorder(
  //         borderSide: BorderSide(color: DevelColors.buttonBlue),
  //       ),
  //       enabledBorder: UnderlineInputBorder(
  //         borderSide: BorderSide(color: DevelColors.hintTextColor),
  //       ),
  //       errorBorder: UnderlineInputBorder(
  //         borderSide: BorderSide(color: Colors.red),
  //       ),
  //       focusedErrorBorder: UnderlineInputBorder(
  //         borderSide: BorderSide(width: 1.5, color: Colors.red),
  //       ),
  //     ),
  //     colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.white),
  //   );
  // }
}
