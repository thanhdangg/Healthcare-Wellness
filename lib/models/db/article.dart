import 'dart:core';

/// `todo` table name
const String tableArticles = 'articles';

/// id column name
const String columnId = '_id';

/// title column name
const String columnTitle = 'title';

/// done column description
const String columnDescription = 'description';

class Article {
  Article(this.title, this.description);

  /// Read from a record.
  Article.fromMap(Map map) {
    id = map[columnId] as int?;
    title = map[columnTitle] as String?;
    description = map[columnDescription] as String?;
  }

  /// id.
  int? id;

  /// title.
  String? title;

  /// description.
  String? description;


  /// Convert to a record.
  Map<String, Object?> toMap() {
    final map = <String, Object?>{columnTitle: title, columnDescription: description};
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }
}
