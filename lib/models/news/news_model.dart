// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));

String newsModelToJson(NewsModel data) => json.encode(data.toJson());

@freezed
class NewsModel with _$NewsModel {
    const factory NewsModel({
        String? status,
        int? totalResults,
        List<Article>? articles,
    }) = _NewsModel;

    factory NewsModel.fromJson(Map<String, dynamic> json) => _$NewsModelFromJson(json);
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
