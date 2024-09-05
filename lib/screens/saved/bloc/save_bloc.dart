import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcare_wellness/utils/enums.dart';
import 'package:healthcare_wellness/models/news/article_save.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

part 'save_event.dart';
part 'save_state.dart';

class SaveBloc extends Bloc<SaveEvent, SaveState> {
  final BuildContext context;

  SaveBloc({required this.context}) : super(SaveState.initial()) {
    on<GetArticleSaved>(_getSavedArticle);
    on<AddArticle>(_addSavedArticle);
    
  }
  Future<void> _getSavedArticle(GetArticleSaved event, Emitter<SaveState> emit) async {
    emit(state.copyWith(status: BlocStateStatus.loading));
    final db = await openDatabase(
      join(await getDatabasesPath(), 'article_saved_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE articles_saved(id INTEGER PRIMARY KEY, title TEXT, description TEXT, url TEXT, urlToImage TEXT, publishedAt TEXT)',
        );
      },
      version: 1,
    );
    final List<Map<String, dynamic>> maps = await db.query('articles');
    List<ArticleSave> articleList = List.generate(maps.length, (i) {
      return ArticleSave(
        id: maps[i]['id'],
        title: maps[i]['title'],
        description: maps[i]['description'],
        url: maps[i]['url'],
        urlToImage: maps[i]['urlToImage'],
        publishedAt: maps[i]['publishedAt'], 
        source: maps[i]['source'], 
        author: maps[i]['author'], 
        content: maps[i]['content'],
      );
    });
    emit(state.copyWith(status: BlocStateStatus.success, articleList: articleList));
  }

  Future<void> _addSavedArticle(AddArticle event, Emitter<SaveState> emit) async {
    final db = await openDatabase(
      join(await getDatabasesPath(), 'article_saved_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE articles_saved(id INTEGER PRIMARY KEY, title TEXT, description TEXT, url TEXT, urlToImage TEXT, publishedAt TEXT)',
        );
      },
      version: 1,
    );
    await db.insert(
      'articles_saved',
      event.article.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    emit(state.copyWith(status: BlocStateStatus.success));
  }
  
}