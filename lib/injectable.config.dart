// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:adoptini_app/auth/data/datasources/local_user_db.dart' as _i8;
import 'package:adoptini_app/auth/data/datasources/location_service.dart'
    as _i3;
import 'package:adoptini_app/auth/data/datasources/remote_user_db.dart' as _i4;
import 'package:adoptini_app/auth/data/repositories/auth_repo.dart' as _i10;
import 'package:adoptini_app/auth/domain/repositories/base_auth_repo.dart'
    as _i9;
import 'package:adoptini_app/auth/domain/usecases/login_usecase.dart' as _i11;
import 'package:adoptini_app/auth/domain/usecases/logout_usecase.dart' as _i12;
import 'package:adoptini_app/auth/domain/usecases/register_usecase.dart'
    as _i13;
import 'package:adoptini_app/auth/domain/usecases/start_app_usecase.dart'
    as _i14;
import 'package:adoptini_app/utils/register_module.dart' as _i15;
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.lazySingleton<_i3.BaseLocationService>(() => _i3.LocationService());
    gh.lazySingleton<_i4.BaseRemoteUserDB>(() => _i4.RemoteUserDB(
          gh<_i5.FirebaseFirestore>(),
          gh<_i6.FirebaseAuth>(),
        ));
    await gh.factoryAsync<_i7.Isar>(
      () => registerModule.isar,
      preResolve: true,
    );
    gh.lazySingleton<_i8.BaseLocalUserDB>(
        () => _i8.LocalUserDB(gh<_i7.Isar>()));
    gh.lazySingleton<_i9.BaseAuthRepo>(() => _i10.AuthRepo(
          gh<_i4.BaseRemoteUserDB>(),
          gh<_i6.FirebaseAuth>(),
          gh<_i8.BaseLocalUserDB>(),
        ));
    gh.factory<_i11.LoginUsecase>(
        () => _i11.LoginUsecase(gh<_i9.BaseAuthRepo>()));
    gh.factory<_i12.LogoutUseCase>(
        () => _i12.LogoutUseCase(gh<_i9.BaseAuthRepo>()));
    gh.factory<_i13.RegisterUsecase>(() => _i13.RegisterUsecase(
          gh<_i9.BaseAuthRepo>(),
          gh<_i3.BaseLocationService>(),
        ));
    gh.factory<_i14.StartAppUsecase>(
        () => _i14.StartAppUsecase(gh<_i9.BaseAuthRepo>()));
    return this;
  }
}

class _$RegisterModule extends _i15.RegisterModule {}
