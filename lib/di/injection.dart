import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio/data/providers/remote/backend_service_api.dart';
import 'package:portfolio/data/providers/remote/backend_service_api_impl.dart';
import 'package:portfolio/di/injection.config.dart';

// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: false,
  asExtension: false, // default
)
void configureDependencies() => $initGetIt(GetIt.instance);

@module
abstract class NetworkingModule {
  @lazySingleton
  Dio get dio => Dio();

  @lazySingleton
  BackendServiceApi backendServiceApi(
          BackendServiceApiImpl backendServiceApiImpl) =>
      backendServiceApiImpl;

  @lazySingleton
  BaseCacheManager get imageCacheManger => DefaultCacheManager();
}
