part of 'home_bloc.dart';

class HomeState {
  final BlocStateStatus status;
  final List<Article>? articleList;

  HomeState({required this.status, this.articleList});

  factory HomeState.initial() => HomeState(
        status: BlocStateStatus.initial,
        articleList: [],
      );

  HomeState copyWith({
    BlocStateStatus? status,
    List<Article>? articleList,
  }) {
    return HomeState(
      status: status ?? this.status,
      articleList: articleList ?? this.articleList,
    );
  }
}
