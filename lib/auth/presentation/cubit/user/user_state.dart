part of 'user_cubit.dart';


@freezed
class UserState with _$UserState {
  const factory UserState.initial() = _Initial;
  const factory UserState.loading() = _Loading;
  const factory UserState.userNotLoggedIn() = _UserNotLoggedIn;
  const factory UserState.userLoggedIn(UserModel user) = _UserLoggedIn;
  const factory UserState.error({required String errorMessage}) = _Error;
  const factory UserState.updatingLocation() = _UpdatingLocation;
  const factory UserState.updatedLocation() = _UpdatedLocation;
  const factory UserState.userUpdated(UserModel user) = _UserUpdated;
}
