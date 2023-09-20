// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:adoptini_app/auth/data/datasources/local_user_db.dart' as _i10;
import 'package:adoptini_app/auth/data/datasources/location_service.dart'
    as _i3;
import 'package:adoptini_app/auth/data/datasources/remote_user_db.dart' as _i7;
import 'package:adoptini_app/auth/data/repositories/auth_repo.dart' as _i16;
import 'package:adoptini_app/auth/domain/repositories/base_auth_repo.dart'
    as _i15;
import 'package:adoptini_app/auth/domain/usecases/login_usecase.dart' as _i17;
import 'package:adoptini_app/auth/domain/usecases/logout_usecase.dart' as _i18;
import 'package:adoptini_app/auth/domain/usecases/register_usecase.dart'
    as _i19;
import 'package:adoptini_app/auth/domain/usecases/start_app_usecase.dart'
    as _i20;
import 'package:adoptini_app/core/home/data/datasources/remote_pet_db.dart'
    as _i4;
import 'package:adoptini_app/core/home/data/repositories/pet_repo.dart' as _i12;
import 'package:adoptini_app/core/home/domain/repositories/base_pet_repo.dart'
    as _i11;
import 'package:adoptini_app/core/home/domain/usecases/add_pet_usecase.dart'
    as _i14;
import 'package:adoptini_app/core/home/domain/usecases/fetch_pet_usecase.dart'
    as _i13;
import 'package:adoptini_app/utils/register_module.dart' as _i21;
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i8;
import 'package:firebase_storage/firebase_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i9;

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
    gh.lazySingleton<_i4.BaseRemotePetDB>(() => _i4.RemotePetDB(
          gh<_i5.FirebaseFirestore>(),
          gh<_i6.FirebaseStorage>(),
        ));
    gh.lazySingleton<_i7.BaseRemoteUserDB>(() => _i7.RemoteUserDB(
          gh<_i5.FirebaseFirestore>(),
          gh<_i8.FirebaseAuth>(),
        ));
    await gh.factoryAsync<_i9.Isar>(
      () => registerModule.isar,
      preResolve: true,
    );
    gh.lazySingleton<_i10.BaseLocalUserDB>(
        () => _i10.LocalUserDB(gh<_i9.Isar>()));
    gh.lazySingleton<_i11.BasePetRepo>(() => _i12.PetRepo(
          gh<_i4.BaseRemotePetDB>(),
          gh<_i3.BaseLocationService>(),
        ));
    gh.lazySingleton<_i13.FetchPetUsecase>(
        () => _i13.FetchPetUsecase(gh<_i11.BasePetRepo>()));
    gh.factory<_i14.AddPetUsecase>(
        () => _i14.AddPetUsecase(gh<_i11.BasePetRepo>()));
    gh.lazySingleton<_i15.BaseAuthRepo>(() => _i16.AuthRepo(
          gh<_i7.BaseRemoteUserDB>(),
          gh<_i8.FirebaseAuth>(),
          gh<_i10.BaseLocalUserDB>(),
        ));
    gh.factory<_i17.LoginUsecase>(
        () => _i17.LoginUsecase(gh<_i15.BaseAuthRepo>()));
    gh.factory<_i18.LogoutUseCase>(
        () => _i18.LogoutUseCase(gh<_i15.BaseAuthRepo>()));
    gh.factory<_i19.RegisterUsecase>(() => _i19.RegisterUsecase(
          gh<_i15.BaseAuthRepo>(),
          gh<_i3.BaseLocationService>(),
        ));
    gh.factory<_i20.StartAppUsecase>(
        () => _i20.StartAppUsecase(gh<_i15.BaseAuthRepo>()));
    return this;
  }
}

class _$RegisterModule extends _i21.RegisterModule {}
