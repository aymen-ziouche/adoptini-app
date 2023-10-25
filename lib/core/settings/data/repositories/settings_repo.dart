

import 'package:adoptini_app/core/settings/data/datasources/settings_local_data_source.dart';
import 'package:adoptini_app/core/settings/data/models/settings_model.dart';
import 'package:adoptini_app/core/settings/domain/entities/settings_entity.dart';
import 'package:adoptini_app/core/settings/domain/repositories/base_settings_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BaseSettingsRepository)
class SettingsRepository implements BaseSettingsRepository {
  final BaseSettingsLocalDataSource settingsLocalDataSource;
  SettingsRepository({
    required this.settingsLocalDataSource,
  });
  @override
  Settings getSettings() {
    final result = settingsLocalDataSource.getSettings();
    return result ?? Settings.defaultSettings();
  }

  @override
  void setSettings({required SettingsModel settings}) {
    settingsLocalDataSource.setSettings(settings: settings);
  }
}
