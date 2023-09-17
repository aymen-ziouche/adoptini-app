import 'package:adoptini_app/auth/data/models/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<Isar> get isar async {
    var instance = Isar.getInstance('LocalDb');
    if (instance == null) {
      final dir = await getApplicationSupportDirectory();
      instance = await Isar.open(
        [
          UserModelSchema,
        ],
        directory: dir.path,
        name: 'LocalDb',
      );
    }
    return instance;
  }
}
