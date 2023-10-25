


import 'package:adoptini_app/core/settings/data/models/settings_model.dart';
import 'package:adoptini_app/core/settings/domain/entities/settings_entity.dart';
import 'package:adoptini_app/core/settings/domain/repositories/base_settings_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class SetSettingsUseCase {
  final BaseSettingsRepository settingsRepository;
  SetSettingsUseCase({
    required this.settingsRepository,
  });

  void call({required Settings settings})  {
     settingsRepository.setSettings(settings: SettingsModel.fromSettings(settings));
  }
}
