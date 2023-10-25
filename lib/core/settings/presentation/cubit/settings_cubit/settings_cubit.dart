import 'package:adoptini_app/core/settings/domain/entities/settings_entity.dart';
import 'package:adoptini_app/core/settings/domain/usecases/get_settings_usecase.dart';
import 'package:adoptini_app/core/settings/domain/usecases/set_settings_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.dart';
part 'settings_cubit.freezed.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final GetSettingsUseCase getSettingsUseCase;
  final SetSettingsUseCase setSettingsUseCase;
  SettingsCubit(this.getSettingsUseCase, this.setSettingsUseCase) : super(const SettingsState.initial());

  Settings? settings;
  void getSettings() {
    emit(const SettingsState.settingsLoading());
    settings = getSettingsUseCase();
    emit(const SettingsState.settingsLoaded());
    print("Settings loaded ${settings!.firstUse}");
  }

  void setSettings({required Settings newSettings}) {
    emit(const SettingsState.settingsLoading());
    settings = newSettings;
    setSettingsUseCase(settings: newSettings);
    emit(const SettingsState.settingsPresisted());
  }
}
