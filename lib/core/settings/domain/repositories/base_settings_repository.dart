

import 'package:adoptini_app/core/settings/data/models/settings_model.dart';
import 'package:adoptini_app/core/settings/domain/entities/settings_entity.dart';

abstract class BaseSettingsRepository {
  Settings getSettings();
  void setSettings({required SettingsModel settings});
}
