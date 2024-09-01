import 'package:dio/dio.dart';

class AppDio {
  final dio = Dio()
    ..options.baseUrl = 'https://newsapi.org'
    ..options.responseType = ResponseType.json
    ..options.sendTimeout = const Duration(milliseconds: 30000);
}
