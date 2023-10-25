


import 'package:adoptini_app/core/settings/domain/entities/settings_entity.dart';
import 'package:adoptini_app/core/settings/domain/repositories/base_settings_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetSettingsUseCase {
  final BaseSettingsRepository settingsRepository;
  GetSettingsUseCase({
    required this.settingsRepository,
  });

Settings call()  {
    return  settingsRepository.getSettings();
  }
}
