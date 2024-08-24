import 'package:healthcare_wellness/configs/locator.dart';
import 'package:healthcare_wellness/models/news/news_model.dart';

class NewsRepository {
  /// Get the list device information
  Future<NewsModel> getNewsData() async {
    final res = await dio.get(
        '/v2/everything?q=tesla&from=2024-07-24&sortBy=publishedAt&apiKey=5caf54bf092b424fbac67aa3a8842532');
    if (res.statusCode == 200) {
      final newsResponce = res.data;

      return NewsModel.fromJson(newsResponce);
    } else {
      return const NewsModel();
    }
  }
}
