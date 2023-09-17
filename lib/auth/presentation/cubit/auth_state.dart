part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loggingIn() = _LoggingIn;
  const factory AuthState.registering() = _Registering;
  const factory AuthState.loginsuccess(UserModel user) = _Loginsuccess;
  const factory AuthState.registersuccess(UserModel user) = _Registersuccess;
  const factory AuthState.error(String errorMessage) = _Error;
}
