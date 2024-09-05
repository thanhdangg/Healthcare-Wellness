part of 'save_bloc.dart';

class SaveState {
  final BlocStateStatus status;
  final List<ArticleSave>? articleList;

  SaveState({required this.status, this.articleList});

  factory SaveState.initial() => SaveState(
        status: BlocStateStatus.initial,
        articleList: [],
      );

  SaveState copyWith({
    BlocStateStatus? status,
    List<ArticleSave>? articleList,
  }) {
    return SaveState(
      status: status ?? this.status,
      articleList: articleList ?? this.articleList,
    );
  }
}