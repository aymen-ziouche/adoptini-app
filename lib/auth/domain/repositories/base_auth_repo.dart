import 'package:adoptini_app/auth/data/models/user_model.dart';

abstract class BaseAuthRepo {
  Future<UserModel> login({required String email, required String password});
  Future<UserModel?> getUserData();
  Future<void> logout();
  Future<void> resetPassword({required String email});
  Future<UserModel> registerUser({required UserModel user, required String password});
}
