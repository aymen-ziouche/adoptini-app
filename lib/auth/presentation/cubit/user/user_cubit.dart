import 'package:adoptini_app/auth/data/models/user_model.dart';
import 'package:adoptini_app/auth/domain/usecases/logout_usecase.dart';
import 'package:adoptini_app/auth/domain/usecases/start_app_usecase.dart';
import 'package:adoptini_app/auth/domain/usecases/update_user_location_usecase.dart';
import 'package:adoptini_app/auth/domain/usecases/update_user_usercase.dart';
import 'package:adoptini_app/generated/locale_keys.g.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

class UserCubit extends Cubit<UserState> {
  final StartAppUsecase _startApp;
  final UpdateUserLocationUsecase _updateUserLocationUsecase;
  final UpdateUserUsecase _updateUserUsecase;
  final LogoutUseCase _logout;

  UserModel? _user;

  UserCubit(this._startApp, this._logout, this._updateUserLocationUsecase, this._updateUserUsecase)
      : super(UserState.initial());

  Future<void> startApp() async {
    final user = await _startApp();
    if (user == null) {
      emit(UserState.userNotLoggedIn());
    } else {
      _user = user;
      emit(UserState.userLoggedIn(user));
    }
  }

  Future<void> setUser(UserModel user) async {
    _user = user;
    emit(UserState.userLoggedIn(user));
  }

  Future<void> updateUserLocation(String uid) async {
    try {
      emit(UserState.updatingLocation());
      await _updateUserLocationUsecase(uid);
      emit(UserState.updatedLocation());
    } catch (e) {
      emit(UserState.error(errorMessage: LocaleKeys.error_updating_location.tr()));
    }
  }

  Future<void> updateUser(UserModel currentUser) async {
    try {
      emit(UserState.loading());
      await _updateUserUsecase.call(
        currentUser,
      );
      _user = currentUser;
      emit(UserState.userUpdated(user!));
    } catch (e) {
      emit(UserState.error(errorMessage: LocaleKeys.error_updating_user.tr()));
    }
  }

  UserModel? get user => _user;

  Future<void> logout() async {
    await _logout();
    _user = null;
    emit(UserState.userNotLoggedIn());
  }

  @override
  void onChange(Change<UserState> change) {
    debugPrint(change.toString());
    super.onChange(change);
  }
}
