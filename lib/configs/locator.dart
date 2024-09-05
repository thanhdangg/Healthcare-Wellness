import 'package:get_it/get_it.dart';
import 'package:healthcare_wellness/configs/app_dio.dart';
import 'package:healthcare_wellness/configs/app_router.dart';
import 'package:healthcare_wellness/database/article/article_provider.dart';

final getIt = GetIt.instance;

final dio = getIt<AppDio>().dio;
final articleProvider = getIt<ArticleProvider>();

void setupLocator() {
  getIt.registerSingleton<AppRouter>(AppRouter());
  getIt.registerSingleton<AppDio>(AppDio());
  getIt.registerSingleton<ArticleProvider>(ArticleProvider());
}
