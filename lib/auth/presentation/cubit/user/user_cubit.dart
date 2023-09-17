import 'package:adoptini_app/auth/data/models/user_model.dart';
import 'package:adoptini_app/auth/domain/usecases/logout_usecase.dart';
import 'package:adoptini_app/auth/domain/usecases/start_app_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final StartAppUsecase _startApp;
  final LogoutUseCase _logout;

  UserCubit(this._startApp, this._logout) : super(UserStateLoading());

  Future<void> startApp() async {
    final user = await _startApp();
    user == null ? emit(UserStateNotLoggedIn()) : emit(UserStateLoggedIn(user));
  }

  set user(UserModel user) => emit(UserStateLoggedIn(user));

  UserModel get user {
    return (state as UserStateLoggedIn).user;
  }

  Future<void> logout() async {
    await _logout();
    emit(UserStateNotLoggedIn());
  }

  @override
  void onChange(Change<UserState> change) {
    debugPrint(change.toString());
    super.onChange(change);
  }
}
