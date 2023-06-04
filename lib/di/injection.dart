import 'package:background_downloader/background_downloader.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:injectable/injectable.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio/data/providers/local/local_database.dart';
import 'package:portfolio/data/providers/local/local_database_impl.dart';
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
  FileDownloader get fileDownloader => FileDownloader()
      .configureNotificationForGroup(FileDownloader.defaultGroup,
          running: const TaskNotification(
              'Download {filename}', 'File: {filename} - {progress}'),
          complete: const TaskNotification(
              'Download {filename}', 'Download complete'),
          error:
              const TaskNotification('Download {filename}', 'Download failed'),
          progressBar: true)
      .configureNotification(
          complete: const TaskNotification(
              'Download {filename}', 'Download complete'),
          tapOpensFile: true);

  @lazySingleton
  BackendServiceApi backendServiceApi(
          BackendServiceApiImpl backendServiceApiImpl) =>
      backendServiceApiImpl;

  @lazySingleton
  BaseCacheManager get imageCacheManger => DefaultCacheManager();
}

@module
abstract class PersistenceModule {

  @lazySingleton
  LocalDatabase localDatabase(LocalDatabaseImpl localDatabaseImpl) =>
      localDatabaseImpl;
}
