import 'package:healthcare_wellness/models/db/article.dart';
import 'package:sqflite/sqflite.dart';

class ArticleProvider {
  /// The database when opened.
  late Database db;

  /// Open the database.
  Future open(String path) async {
    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
        create table $tableArticles ( 
        $columnId integer primary key autoincrement, 
        $columnTitle text not null,
        $columnDescription text not null)
        ''');
      },
    );
  }

  Future<Article> insert(Article article) async {
    article.id = await db.insert(tableArticles, article.toMap());
    return article;
  }

  Future<Article?> getArticle(int id) async {
    final List<Map> maps = await db.query(tableArticles,
        columns: [columnId, columnTitle, columnTitle], where: '$columnId = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Article.fromMap(maps.first);
    }
    return null;
  }

  Future<List<Article?>> getAllArticles() async {
    final List<Map> maps = await db.rawQuery('SELECT * FROM $tableArticles');
    if (maps.isNotEmpty) {
      return maps.map((e) => Article.fromMap(e)).toList();
    }
    return [];
  }

  Future<int> delete(int id) async {
    return await db.delete(tableArticles, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> update(Article todo) async {
    return await db
        .update(tableArticles, todo.toMap(), where: '$columnId = ?', whereArgs: [todo.id!]);
  }

  /// Close database.
  Future close() async => db.close();
}
