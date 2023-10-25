// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:adoptini_app/auth/data/datasources/local_user_db.dart' as _i12;
import 'package:adoptini_app/auth/data/datasources/location_service.dart'
    as _i3;
import 'package:adoptini_app/auth/data/datasources/remote_user_db.dart' as _i8;
import 'package:adoptini_app/auth/data/repositories/auth_repo.dart' as _i36;
import 'package:adoptini_app/auth/domain/repositories/base_auth_repo.dart'
    as _i35;
import 'package:adoptini_app/auth/domain/usecases/login_usecase.dart' as _i37;
import 'package:adoptini_app/auth/domain/usecases/logout_usecase.dart' as _i38;
import 'package:adoptini_app/auth/domain/usecases/register_usecase.dart'
    as _i39;
import 'package:adoptini_app/auth/domain/usecases/start_app_usecase.dart'
    as _i40;
import 'package:adoptini_app/auth/domain/usecases/update_user_location_usecase.dart'
    as _i41;
import 'package:adoptini_app/auth/domain/usecases/update_user_usercase.dart'
    as _i42;
import 'package:adoptini_app/core/home/data/datasources/remote_messages_db.dart'
    as _i4;
import 'package:adoptini_app/core/home/data/datasources/remote_pet_db.dart'
    as _i6;
import 'package:adoptini_app/core/home/data/repositories/messages_repo.dart'
    as _i14;
import 'package:adoptini_app/core/home/data/repositories/pet_repo.dart' as _i16;
import 'package:adoptini_app/core/home/domain/repositories/base_messages_repo.dart'
    as _i13;
import 'package:adoptini_app/core/home/domain/repositories/base_pet_repo.dart'
    as _i15;
import 'package:adoptini_app/core/home/domain/usecases/add_pet_to_favorites_usecase.dart'
    as _i33;
import 'package:adoptini_app/core/home/domain/usecases/add_pet_usecase.dart'
    as _i34;
import 'package:adoptini_app/core/home/domain/usecases/delete_pet_usecase.dart'
    as _i23;
import 'package:adoptini_app/core/home/domain/usecases/fetch_conversations_usecase.dart'
    as _i24;
import 'package:adoptini_app/core/home/domain/usecases/fetch_favorites_usecase.dart'
    as _i25;
import 'package:adoptini_app/core/home/domain/usecases/fetch_pet_usecase.dart'
    as _i26;
import 'package:adoptini_app/core/home/domain/usecases/listen_to_messages_usecase.dart'
    as _i28;
import 'package:adoptini_app/core/home/domain/usecases/remove_pet_from_favorites_usecase.dart'
    as _i29;
import 'package:adoptini_app/core/home/domain/usecases/send_msg_about_pet_usercase.dart'
    as _i30;
import 'package:adoptini_app/core/home/domain/usecases/send_msg_usecase.dart'
    as _i31;
import 'package:adoptini_app/core/settings/data/datasources/settings_local_data_source.dart'
    as _i17;
import 'package:adoptini_app/core/settings/data/datasources/ticket_data_source.dart'
    as _i11;
import 'package:adoptini_app/core/settings/data/repositories/settings_repo.dart'
    as _i19;
import 'package:adoptini_app/core/settings/data/repositories/ticket_repo.dart'
    as _i21;
import 'package:adoptini_app/core/settings/domain/repositories/base_settings_repository.dart'
    as _i18;
import 'package:adoptini_app/core/settings/domain/repositories/base_ticket_repository.dart'
    as _i20;
import 'package:adoptini_app/core/settings/domain/usecases/create_ticket_usecase.dart'
    as _i22;
import 'package:adoptini_app/core/settings/domain/usecases/get_settings_usecase.dart'
    as _i27;
import 'package:adoptini_app/core/settings/domain/usecases/set_settings_usecase.dart'
    as _i32;
import 'package:adoptini_app/utils/register_module.dart' as _i43;
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_auth/firebase_auth.dart' as _i9;
import 'package:firebase_storage/firebase_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:isar/isar.dart' as _i10;

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
    gh.lazySingleton<_i4.BaseRemoteMessagesDB>(
        () => _i4.RemoteMessagesDB(gh<_i5.FirebaseFirestore>()));
    gh.lazySingleton<_i6.BaseRemotePetDB>(() => _i6.RemotePetDB(
          gh<_i5.FirebaseFirestore>(),
          gh<_i7.FirebaseStorage>(),
        ));
    gh.lazySingleton<_i8.BaseRemoteUserDB>(() => _i8.RemoteUserDB(
          gh<_i5.FirebaseFirestore>(),
          gh<_i9.FirebaseAuth>(),
        ));
    await gh.factoryAsync<_i10.Isar>(
      () => registerModule.isar,
      preResolve: true,
    );
    gh.factory<_i11.TicketsDataSource>(() => _i11.ApiTicketsDataSource(
          gh<_i5.FirebaseFirestore>(),
          gh<_i7.FirebaseStorage>(),
        ));
    gh.lazySingleton<_i12.BaseLocalUserDB>(
        () => _i12.LocalUserDB(gh<_i10.Isar>()));
    gh.lazySingleton<_i13.BaseMessagesRepo>(
        () => _i14.MessagesRepo(gh<_i4.BaseRemoteMessagesDB>()));
    gh.lazySingleton<_i15.BasePetRepo>(() => _i16.PetRepo(
          gh<_i6.BaseRemotePetDB>(),
          gh<_i3.BaseLocationService>(),
        ));
    gh.factory<_i17.BaseSettingsLocalDataSource>(
        () => _i17.SettingsLocalDataSource(isar: gh<_i10.Isar>()));
    gh.factory<_i18.BaseSettingsRepository>(() => _i19.SettingsRepository(
        settingsLocalDataSource: gh<_i17.BaseSettingsLocalDataSource>()));
    gh.factory<_i20.BaseTicketsRepository>(
        () => _i21.TicketsRepository(gh<_i11.TicketsDataSource>()));
    gh.factory<_i22.CreateTicketUseCase>(
        () => _i22.CreateTicketUseCase(gh<_i20.BaseTicketsRepository>()));
    gh.factory<_i23.DeletePetUsecase>(
        () => _i23.DeletePetUsecase(gh<_i15.BasePetRepo>()));
    gh.factory<_i24.FetchConversationsUsecase>(
        () => _i24.FetchConversationsUsecase(gh<_i13.BaseMessagesRepo>()));
    gh.lazySingleton<_i25.FetchFavoritesUsecase>(
        () => _i25.FetchFavoritesUsecase(gh<_i15.BasePetRepo>()));
    gh.lazySingleton<_i26.FetchPetUsecase>(
        () => _i26.FetchPetUsecase(gh<_i15.BasePetRepo>()));
    gh.factory<_i27.GetSettingsUseCase>(() => _i27.GetSettingsUseCase(
        settingsRepository: gh<_i18.BaseSettingsRepository>()));
    gh.factory<_i28.MessagesUsecase>(
        () => _i28.MessagesUsecase(gh<_i13.BaseMessagesRepo>()));
    gh.factory<_i29.RemovePetFromFavoritesUsecase>(
        () => _i29.RemovePetFromFavoritesUsecase(gh<_i15.BasePetRepo>()));
    gh.factory<_i30.SendMsgAboutPetUsecase>(
        () => _i30.SendMsgAboutPetUsecase(gh<_i13.BaseMessagesRepo>()));
    gh.factory<_i31.SendMsgUsecase>(
        () => _i31.SendMsgUsecase(gh<_i13.BaseMessagesRepo>()));
    gh.factory<_i32.SetSettingsUseCase>(() => _i32.SetSettingsUseCase(
        settingsRepository: gh<_i18.BaseSettingsRepository>()));
    gh.factory<_i33.AddPetToFavoritesUsecase>(
        () => _i33.AddPetToFavoritesUsecase(gh<_i15.BasePetRepo>()));
    gh.factory<_i34.AddPetUsecase>(
        () => _i34.AddPetUsecase(gh<_i15.BasePetRepo>()));
    gh.lazySingleton<_i35.BaseAuthRepo>(() => _i36.AuthRepo(
          gh<_i8.BaseRemoteUserDB>(),
          gh<_i9.FirebaseAuth>(),
          gh<_i12.BaseLocalUserDB>(),
        ));
    gh.factory<_i37.LoginUsecase>(
        () => _i37.LoginUsecase(gh<_i35.BaseAuthRepo>()));
    gh.factory<_i38.LogoutUseCase>(
        () => _i38.LogoutUseCase(gh<_i35.BaseAuthRepo>()));
    gh.factory<_i39.RegisterUsecase>(() => _i39.RegisterUsecase(
          gh<_i35.BaseAuthRepo>(),
          gh<_i3.BaseLocationService>(),
        ));
    gh.factory<_i40.StartAppUsecase>(
        () => _i40.StartAppUsecase(gh<_i35.BaseAuthRepo>()));
    gh.factory<_i41.UpdateUserLocationUsecase>(
        () => _i41.UpdateUserLocationUsecase(gh<_i35.BaseAuthRepo>()));
    gh.factory<_i42.UpdateUserUsecase>(
        () => _i42.UpdateUserUsecase(gh<_i35.BaseAuthRepo>()));
    return this;
  }
}

class _$RegisterModule extends _i43.RegisterModule {}
