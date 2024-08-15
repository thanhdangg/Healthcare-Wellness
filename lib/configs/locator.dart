import 'package:get_it/get_it.dart';
import 'package:healthcare_wellness/configs/app_dio.dart';
import 'package:healthcare_wellness/configs/app_router.dart';

final getIt = GetIt.instance;

final dio = getIt<AppDio>().dio;

void setupLocator() {
  getIt.registerSingleton<AppRouter>(AppRouter());
  getIt.registerSingleton<AppDio>(AppDio());
}
