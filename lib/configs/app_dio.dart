import 'package:dio/dio.dart';

class AppDio {
  final dio = Dio()
    ..options.baseUrl = 'https://api.restful-api.dev'
    ..options.responseType = ResponseType.json
    ..options.sendTimeout = const Duration(milliseconds: 30000);
}
