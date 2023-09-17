part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserStateLoading extends UserState {}

class UserStateNotLoggedIn extends UserState {}

class UserStateLoggedIn extends UserState {
  final UserModel user;
  const UserStateLoggedIn(this.user);
  @override
  List<Object> get props => [user];
}

class UserProfileCreated extends UserState {}

class UserErrorState extends UserState {
  final String errorMessage;
  const UserErrorState(this.errorMessage);
  @override
  List<Object> get props => [errorMessage];
}