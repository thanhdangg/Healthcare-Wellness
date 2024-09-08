part of 'explore_bloc.dart';

abstract class ExploreEvent {}

class FetchRecentNews extends ExploreEvent {}

class FetchNewsByCategory extends ExploreEvent {
  final String category;
  FetchNewsByCategory({required this.category});
}
class SaveArticleExploreToDB extends ExploreEvent {
  final Article article;
  SaveArticleExploreToDB({required this.article});
}

// class FetchRecommended extends ExploreEvent {}
