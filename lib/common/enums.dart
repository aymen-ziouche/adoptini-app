import 'package:adoptini_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

enum PetGender {
  male,
  female;

  String tr() {
    switch (this) {
      case PetGender.male:
        return LocaleKeys.maleGender.tr();
      case PetGender.female:
        return LocaleKeys.femaleGender.tr();

      default:
        return 'Unknown';
    }
  }
}

enum PetSize {
  big,
  medium,
  small;

  String tr() {
    switch (this) {
      case PetSize.big:
        return LocaleKeys.big.tr();
      case PetSize.medium:
        return LocaleKeys.medium.tr();
      case PetSize.small:
        return LocaleKeys.small.tr();

      default:
        return 'Unknown';
    }
  }
}

enum PetType {
  all,
  cat,
  dog,
  bird,
  other;

  String tr() {
    switch (this) {
      case PetType.all:
        return LocaleKeys.all.tr();
      case PetType.cat:
        return LocaleKeys.cat.tr();
      case PetType.dog:
        return LocaleKeys.dog.tr();
      case PetType.bird:
        return LocaleKeys.bird.tr();
      case PetType.other:
        return LocaleKeys.otherPets.tr();

      default:
        return 'Unknown';
    }
  }
}

enum TicketType {
  bug,
  feature,
  suggestion,
  help;

  String tr() {
    switch (this) {
      case TicketType.bug:
        return LocaleKeys.bug.tr();
      case TicketType.feature:
        return LocaleKeys.feature.tr();
      case TicketType.suggestion:
        return LocaleKeys.suggestion.tr();
      case TicketType.help:
        return LocaleKeys.help.tr();

      default:
        return 'Unknown';
    }
  }
}

enum Languages { english, french, arabic }
