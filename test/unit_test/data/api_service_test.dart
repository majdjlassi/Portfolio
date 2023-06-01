import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:portfolio/data/providers/remote/api_service.dart';
import 'package:portfolio/utils/utils.dart';

void main() {
  late ApiService apiService;
  late Dio dio;
  late DioAdapter dioAdapter;

  setUp(() {
    dio = Dio(BaseOptions());
    dioAdapter = DioAdapter(dio: dio);
    apiService = ApiService(dio);
  });

  tearDown(() {
    dioAdapter.reset();
  });

  test('getExperiences returns a list of Experience', () async {

    final response = await getMockExperienceDataFromJsonFile();

    dioAdapter.onGet(
      '/experience.json',
      (server) async => server.reply(
        200,
        response,
        delay: const Duration(seconds: 1),
      ),
    );

    final result = await apiService.getExperiences();

    expect(result.length, 5);
    expect(result.first.id, 1);
    expect(result.first.companyName, 'Midge Medical GmbH');
    expect(result.first.duration, 'Jul 2022 - Present');
    expect(result.first.projects.isNotEmpty, true);
  });

  test('getPersonalInfo return an object of PersonalInfo', () async {
    final response = await getMockPersonalInfoDataFromJsonFile();

    dioAdapter.onGet(
      '/personal_info.json',
      (server) async => server.reply(
        200,
        response,
        delay: const Duration(seconds: 1),
      ),
    );

    final result = await apiService.getPersonalInfo();

    expect(result.name, 'Majd Jlassi');
    expect(result.email, 'jlmajd3@gmail.com');
    expect(result.address, 'Charlotte-E.-Pauly-Straße 16, 12587 Berlin');
    expect(result.skills.isNotEmpty, true);
    expect(result.education.isNotEmpty, true);
    expect(result.languages.isNotEmpty, true);
  });
}
