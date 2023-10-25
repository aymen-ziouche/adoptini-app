

import 'package:adoptini_app/core/settings/data/models/settings_model.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

abstract class BaseSettingsLocalDataSource {
  SettingsModel? getSettings();
  void setSettings({required SettingsModel settings});
}

@Injectable(as: BaseSettingsLocalDataSource)
class SettingsLocalDataSource implements BaseSettingsLocalDataSource {
  Isar isar;
  SettingsLocalDataSource({
    required this.isar,
  });

  @override
  SettingsModel? getSettings() {
    return isar.collection<SettingsModel>().getSync(0);
  }

  @override
  void setSettings({required SettingsModel settings}) {
    isar.writeTxnSync(() {
      isar.collection<SettingsModel>().putSync(settings);
    });
  }
}
