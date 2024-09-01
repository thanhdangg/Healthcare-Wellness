import 'package:flutter/material.dart';
import 'package:healthcare_wellness/configs/locator.dart';
import 'package:healthcare_wellness/models/news/news_response_model.dart';

class NewsRepository {
  /// Get the list device information
  // ignore: non_constant_identifier_names
  final String API_KEY = "5caf54bf092b424fbac67aa3a8842532";
  Future<NewsResponseModel> getNewsData(
      {required String query,
      required String date,
      String sortBy = 'publishedAt'}) async {
    final queryParam = {
      'q': query,
      'from': date,
      'sortBy': sortBy,
      'apiKey': API_KEY
    };
    final res = await dio.get('/v2/everything', queryParameters: queryParam);
    if (res.statusCode == 200) {
      final newsResponce = res.data;
      return NewsResponseModel.fromJson(newsResponce);
    } else {
      return const NewsResponseModel();
    }
  }

  Future<List<Article>> fetchRecentNews() async {
    try {
      final response = await dio.get(
        '/v2/everything',
        queryParameters: {
          'q': 'news',
          'apiKey': API_KEY,
          'from': TimeOfDay.now().toString(),
        },
      );
      final newsResponse = NewsResponseModel.fromJson(response.data);
      return newsResponse.articles ?? [];
    } catch (e) {
      throw Exception('Failed to fetch recent news: $e');
    }
  }

  Future<List<Article>> fetchRecommended() async {
    try {
      final response = await dio.get(
        '/v2/everything',
        queryParameters: {
          'q': 'recommendations',
          'apiKey': API_KEY,
          'from': TimeOfDay.now().toString(),
        },
      );
      final newsResponse = NewsResponseModel.fromJson(response.data);
      return newsResponse.articles ?? [];
    } catch (e) {
      throw Exception('Failed to fetch recommended news: $e');
    }
  }
}
