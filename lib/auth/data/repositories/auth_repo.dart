import 'package:adoptini_app/auth/data/datasources/remote_user_db.dart';
import 'package:adoptini_app/auth/data/datasources/local_user_db.dart';
import 'package:adoptini_app/auth/data/models/user_model.dart';
import 'package:adoptini_app/auth/domain/repositories/base_auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

@LazySingleton(as: BaseAuthRepo)
class AuthRepo implements BaseAuthRepo {
  final FirebaseAuth auth;
  final BaseLocalUserDB _userDB;
  final BaseRemoteUserDB remoteUserDB;

  AuthRepo(this.remoteUserDB, this.auth, this._userDB);

  @override
  Future<UserModel> login({required String email, required String password}) async {
    final authResult = await auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    UserModel user = await remoteUserDB.getCurrentUserData(id: authResult.user!.uid);
    await _userDB.saveUser(user);
    return user;
  }

  @override
  Future<UserModel> registerUser({required UserModel user, required String password}) async {
    UserModel myUser = await remoteUserDB.saveUser(user: user, password: password);
    await _userDB.saveUser(myUser);
    return myUser;
  }

  @override
  Future<void> logout() async {
    await auth.signOut();
  }

  @override
  Future<void> resetPassword({required String email}) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> getUserData() async {
    try {
      if (auth.currentUser != null) {
        String id = auth.currentUser!.uid;
        var local = _userDB.getUser();
        if (local != null) {
          local = await remoteUserDB.getCurrentUserData(id: id);
          await _userDB.saveUser(local);
        }
        return local;
      } else {
        return null;
      }
    } catch (e) {
      Sentry.captureException(e);
      return null;
    }
  }
}
