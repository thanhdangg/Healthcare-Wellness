import 'package:healthcare_wellness/configs/locator.dart';
import 'package:healthcare_wellness/models/news/news_response_model.dart';

class NewsRepository {
  /// Get the list device information
  Future<NewsResponseModel> getNewsData(
      {required String query, required String date, String sortBy = 'publishedAt'}) async {
    final queryParam = {
      'q': query,
      'from': date,
      'sortBy': sortBy,
      'apiKey': '5caf54bf092b424fbac67aa3a8842532',
    };
    final res = await dio.get('/v2/everything', queryParameters: queryParam);
    if (res.statusCode == 200) {
      final newsResponce = res.data;
      return NewsResponseModel.fromJson(newsResponce);
    } else {
      return const NewsResponseModel();
    }
  }
}
