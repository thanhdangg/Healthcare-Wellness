// To parse this JSON data, do
//
//     final newsResponseModel = newsResponseModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'news_response_model.freezed.dart';
part 'news_response_model.g.dart';

NewsResponseModel newsResponseModelFromJson(String str) => NewsResponseModel.fromJson(json.decode(str));

String newsResponseModelToJson(NewsResponseModel data) => json.encode(data.toJson());

@freezed
class NewsResponseModel with _$NewsResponseModel {
    const factory NewsResponseModel({
        String? status,
        int? totalResults,
        List<Article>? articles,
    }) = _NewsResponseModel;

    factory NewsResponseModel.fromJson(Map<String, dynamic> json) => _$NewsResponseModelFromJson(json);
}

@freezed
class Article with _$Article {
    const factory Article({
        Source? source,
        String? author,
        String? title,
        String? description,
        String? url,
        String? urlToImage,
        String? publishedAt,
        String? content,
    }) = _Article;

    factory Article.fromJson(Map<String, dynamic> json) => _$ArticleFromJson(json);
}

@freezed
class Source with _$Source {
    const factory Source({
        String? id,
        String? name,
    }) = _Source;

    factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}
