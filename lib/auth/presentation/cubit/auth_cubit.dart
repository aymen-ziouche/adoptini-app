import 'package:adoptini_app/auth/data/models/user_model.dart';
import 'package:adoptini_app/auth/domain/usecases/login_usecase.dart';
import 'package:adoptini_app/auth/domain/usecases/register_usecase.dart';
import 'package:adoptini_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUsecase _login;
  final RegisterUsecase _register;
  AuthCubit(
    this._login,
    this._register,
  ) : super(const AuthState.initial());

  Future<void> login(String email, String password) async {
    try {
      emit(const AuthState.loggingIn());
      final user = await _login(email, password);
      emit(AuthState.loginsuccess(user));
    } catch (e) {
      emit(AuthState.error(LocaleKeys.failed_to_login.tr()));
    }
  }

  Future<void> register(String name, String email, String password) async {
    try {
      emit(const AuthState.registering());
      final user = await _register(name, email, password);
      emit(AuthState.registersuccess(user));
    } catch (e) {
      emit(AuthState.error(LocaleKeys.failed_to_register.tr()));
    }
  }
}
