import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:healthcare_wellness/configs/locator.dart';
import 'package:healthcare_wellness/models/news/news_model.dart';

class NewsResponseModel {
  /// Get the list device information
  Future<NewsModel> getNewsData({
    required String query,
    String? from,
    required String sortBy,
    required String apiKey,
  }) async {
    final queryParams = {
      'q': query,
      if (from != null) 'from': from,
      'sortBy': sortBy,
      'apiKey': apiKey,
    };

    final res = await dio.get('/v2/everything', queryParameters: queryParams);
    if (res.statusCode == 200) {
      final newsResponce = res.data;

      return NewsModel.fromJson(newsResponce);
    } else {
      return const NewsModel();
    }
  }
}
