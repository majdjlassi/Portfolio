// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:background_downloader/background_downloader.dart' as _i5;
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_cache_manager/flutter_cache_manager.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:portfolio/data/providers/local/local_database.dart' as _i9;
import 'package:portfolio/data/providers/local/local_database_impl.dart' as _i6;
import 'package:portfolio/data/providers/remote/backend_service_api.dart'
    as _i11;
import 'package:portfolio/data/providers/remote/backend_service_api_impl.dart'
    as _i8;
import 'package:portfolio/data/repositories/experience_repository.dart' as _i12;
import 'package:portfolio/data/repositories/personal_info_repository.dart'
    as _i13;
import 'package:portfolio/di/injection.dart' as _i16;
import 'package:portfolio/presentation/cubit/experience_cubit/experience_cubit.dart'
    as _i14;
import 'package:portfolio/presentation/cubit/page_view_cubit/page_view_cubit_cubit.dart'
    as _i7;
import 'package:portfolio/presentation/cubit/personal_info_cubit/personal_info_cubit.dart'
    as _i15;
import 'package:portfolio/presentation/cubit/resume_cubit/resume_cubit.dart'
    as _i10;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final networkingModule = _$NetworkingModule();
  final persistenceModule = _$PersistenceModule();
  gh.lazySingleton<_i3.BaseCacheManager>(
      () => networkingModule.imageCacheManger);
  gh.lazySingleton<_i4.Dio>(() => networkingModule.dio);
  gh.lazySingleton<_i5.FileDownloader>(() => networkingModule.fileDownloader);
  gh.factory<_i6.LocalDatabaseImpl>(() => _i6.LocalDatabaseImpl());
  gh.factory<_i7.PageViewCubit>(() => _i7.PageViewCubit(gh<int>()));
  gh.factory<_i8.BackendServiceApiImpl>(
      () => _i8.BackendServiceApiImpl(gh<_i4.Dio>()));
  gh.lazySingleton<_i9.LocalDatabase>(
      () => persistenceModule.localDatabase(gh<_i6.LocalDatabaseImpl>()));
  gh.lazySingleton<_i10.ResumeCubit>(() => _i10.ResumeCubit(
        gh<_i5.FileDownloader>(),
        gh<_i9.LocalDatabase>(),
      ));
  gh.lazySingleton<_i11.BackendServiceApi>(() =>
      networkingModule.backendServiceApi(gh<_i8.BackendServiceApiImpl>()));
  gh.lazySingleton<_i12.ExperienceRepository>(() => _i12.ExperienceRepository(
        gh<_i11.BackendServiceApi>(),
        gh<_i9.LocalDatabase>(),
      ));
  gh.lazySingleton<_i13.PersonalInfoRepository>(
      () => _i13.PersonalInfoRepository(
            gh<_i11.BackendServiceApi>(),
            gh<_i9.LocalDatabase>(),
          ));
  gh.factory<_i14.ExperienceCubit>(
      () => _i14.ExperienceCubit(gh<_i12.ExperienceRepository>()));
  gh.lazySingleton<_i15.PersonalInfoCubit>(
      () => _i15.PersonalInfoCubit(gh<_i13.PersonalInfoRepository>()));
  return getIt;
}

class _$NetworkingModule extends _i16.NetworkingModule {}

class _$PersistenceModule extends _i16.PersistenceModule {}
