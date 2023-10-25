import 'package:adoptini_app/auth/data/models/user_model.dart';

abstract class BaseAuthRepo {
  Future<UserModel> login({required String email, required String password});
  Future<UserModel?> getUserData();
  Future<void> logout();
  Future<void> updateUserLocation( {required String uid, required double lng, required double lat});
  Future<void> updateUser({required UserModel currentUser});
  Future<void> resetPassword({required String email});
  Future<UserModel> registerUser({required UserModel user, required String password});
}
