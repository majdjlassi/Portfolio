// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:portfolio/data/providers/remote/backend_service_api.dart'
    as _i5;
import 'package:portfolio/data/providers/remote/backend_service_api_impl.dart'
    as _i4;
import 'package:portfolio/data/repositories/experience_repository.dart' as _i6;
import 'package:portfolio/data/repositories/personal_info_repository.dart'
    as _i7;
import 'package:portfolio/di/injection.dart' as _i10;
import 'package:portfolio/presentation/cubit/experience_cubit/experience_cubit.dart'
    as _i8;
import 'package:portfolio/presentation/cubit/personal_info_cubit/personal_info_cubit.dart'
    as _i9;

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
  gh.lazySingleton<_i3.Dio>(() => networkingModule.dio);
  gh.factory<_i4.BackendServiceApiImpl>(
      () => _i4.BackendServiceApiImpl(gh<_i3.Dio>()));
  gh.lazySingleton<_i5.BackendServiceApi>(() =>
      networkingModule.backendServiceApi(gh<_i4.BackendServiceApiImpl>()));
  gh.lazySingleton<_i6.ExperienceRepository>(
      () => _i6.ExperienceRepository(gh<_i5.BackendServiceApi>()));
  gh.lazySingleton<_i7.PersonalInfoRepository>(
      () => _i7.PersonalInfoRepository(gh<_i5.BackendServiceApi>()));
  gh.factory<_i8.ExperienceCubit>(
      () => _i8.ExperienceCubit(gh<_i6.ExperienceRepository>()));
  gh.lazySingleton<_i9.PersonalInfoCubit>(
      () => _i9.PersonalInfoCubit(gh<_i7.PersonalInfoRepository>()));
  return getIt;
}

class _$NetworkingModule extends _i10.NetworkingModule {}
