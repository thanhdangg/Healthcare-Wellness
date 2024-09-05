part of 'home_bloc.dart';

abstract class HomeEvent {}

class GetNewsDataList extends HomeEvent {}

class SaveArticleToDB extends HomeEvent {
  final Article article;
  SaveArticleToDB({required this.article});
}
