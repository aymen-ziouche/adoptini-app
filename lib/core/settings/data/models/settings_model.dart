import 'package:adoptini_app/common/enums.dart';
import 'package:adoptini_app/core/settings/domain/entities/settings_entity.dart';
import 'package:isar/isar.dart';

part 'settings_model.g.dart';

@Collection()
class SettingsModel extends Settings {
  @Index()
  final Id id;

  const SettingsModel({
    this.id = 0,
    required super.appLanguage,
    required super.firstUse,
  });

  factory SettingsModel.fromSettings(Settings settings) {
    return SettingsModel(
      appLanguage: settings.appLanguage,
      firstUse: settings.firstUse,
    );
  }
}
