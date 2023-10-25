import 'dart:math';

import 'package:adoptini_app/common/enums.dart';
import 'package:flutter/material.dart';

Locale languageToLocales(Languages? language) {
  switch (language) {
    case Languages.english:
      return const Locale('en');
    case Languages.french:
      return const Locale('fr');
    case Languages.arabic:
      return const Locale('ar');
    default:
      return const Locale('en');
  }
}

String generateRandomString(int len) {
  var r = Random();
  String randomString = String.fromCharCodes(List.generate(len, (index) => r.nextInt(33) + 89));
  return randomString;
}
