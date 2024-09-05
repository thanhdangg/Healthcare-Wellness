part of 'save_bloc.dart';

abstract class SaveEvent {
}

class GetArticleSaved extends SaveEvent  {
}

class AddArticle extends SaveEvent {
  final ArticleSave article;

  AddArticle(this.article);
}

