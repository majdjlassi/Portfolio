import 'package:logger/logger.dart';

Logger _logger = Logger(
  filter:
      ProductionFilter(), //it's not necessary now since the app is for testing purposes
  printer: PrefixPrinter(
    PrettyPrinter(
      methodCount: 1, // number of method calls to be displayed
      lineLength: 150,
    ),
  ),
);

extension LogMessage on Object {
  void logd(String className, String methodName, String message) =>
      _logger.d('[$className].$methodName : $message');

  void loge(String className, String methodName, String message) =>
      _logger.e('[$className].$methodName : $message');

  void logw(String className, String methodName, String message) =>
      _logger.w('[$className].$methodName : $message');

  void logi(String className, String methodName, String message) =>
      _logger.i('[$className].$methodName : $message');
}
