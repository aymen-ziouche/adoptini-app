


import 'package:adoptini_app/auth/data/models/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

abstract class BaseLocalUserDB {
  Future<void> saveUser(UserModel user);
  UserModel? getUser();
  Future<void> clearDB();
}

@LazySingleton(as: BaseLocalUserDB)
class LocalUserDB implements BaseLocalUserDB {
  final Isar _isar;
  LocalUserDB(this._isar);

  @override
  UserModel? getUser() {
    try {
      return _isar.userModels.where().findFirstSync();
    } catch (e) {
      Sentry.captureException("Error getting user from DB: $e");
      return null;
    }
  }

  @override
  Future<void> saveUser(UserModel user) async {
    await _isar.writeTxn(() async {
      await _isar.userModels.put(user);
    });
  }

  @override
  Future<void> clearDB() async {
    await _isar.writeTxn(() async => await _isar.clear());
  }
}
