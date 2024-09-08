import 'dart:core';

/// `todo` table name
const String tableArticles = 'articles';

/// id column name
const String columnId = '_id';

/// title column name
const String columnTitle = 'title';

/// done column description
const String columnDescription = 'description';

const String columnUrlToImage = 'urlToImage';

const String columnPublishedAt = 'publishedAt';

class Article {
  
  Article({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.publishedAt,
  });
  factory Article.fromMap(Map<String, dynamic> map) {
  return Article(
    title: map['title'] as String? ?? '',
    description: map['description'] as String? ?? '',
    urlToImage: map['urlToImage'] as String? ?? '',
    publishedAt: map['publishedAt'] as String? ?? '',
  );
}
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
    };
  }
    /// Read from a record.
  // Article.fromMap(Map map) {
  //   id = map[columnId] as int?;
  //   title = map[columnTitle] as String?;
  //   description = map[columnDescription] as String?;
  //   publishedAt = map[publishedAt] as String?;
  //   urlToImage = map[urlToImage] as String?;
  // }

  /// id.
  int? id;

  /// title.
  String? title;

  /// description.
  String? description;

  /// publishedAt.
  String? publishedAt;

  /// urlToImage.
  String? urlToImage;

  /// Convert to a record.
  // Map<String, Object?> toMap() {
  //   final map = <String, Object?>{
  //     columnTitle: title,
  //     columnDescription: description,
  //     columnUrlToImage: urlToImage,
  //     columnPublishedAt: publishedAt
  //   };
  //   if (id != null) {
  //     map[columnId] = id;
  //   }
  //   return map;
  // }
}
