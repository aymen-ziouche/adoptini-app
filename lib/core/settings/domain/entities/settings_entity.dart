// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:adoptini_app/common/enums.dart';
import 'package:isar/isar.dart';


class Settings {

  @Enumerated(EnumType.name)
  final Languages appLanguage;

  final bool firstUse;
  const Settings({
    required this.appLanguage,
    required this.firstUse,
  });

  factory Settings.defaultSettings() => const Settings(
        appLanguage: Languages.english,
        firstUse: true,
      );

  @override
  String toString() {
    return 'appLanguage: $appLanguage, firstUse: $firstUse,)';
  }

  Settings copyWith({
    Languages? appLanguage,
    bool? firstUse,
  }) {
    return Settings(
      appLanguage: appLanguage ?? this.appLanguage,
      firstUse: firstUse ?? this.firstUse,
    );
  }

  @override
  bool operator ==(covariant Settings other) {
    if (identical(this, other)) return true;

    return 
        other.appLanguage == appLanguage &&
        other.firstUse == firstUse;
  }

  @override
  int get hashCode {
    return 
        appLanguage.hashCode ^
        firstUse.hashCode;
  }
}
