part of 'settings_cubit.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState.initial() = _Initial;
  const factory SettingsState.settingsLoading() = _SettingsLoading;
  const factory SettingsState.settingsLoaded() = _SettingsLoaded;
  const factory SettingsState.settingsPresisted() = _SettingsPresisted;
  const factory SettingsState.settingsError({required String errorMessage}) = _SettingsError;


}
