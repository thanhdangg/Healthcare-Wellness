part of 'home_bloc.dart';

class HomeState {
  final BlocStateStatus status;
  final ToastStateStatus? toastStatus;
  final List<Article>? articleList;

  HomeState({
    required this.status,
    this.articleList,
    this.toastStatus,
  });

  factory HomeState.initial() => HomeState(
        status: BlocStateStatus.initial,
        articleList: [],
        toastStatus: null,
      );

  HomeState copyWith({
    BlocStateStatus? status,
    List<Article>? articleList,
    ToastStateStatus? toastStatus,
  }) {
    return HomeState(
      status: status ?? this.status,
      articleList: articleList ?? this.articleList,
      toastStatus: toastStatus,
    );
  }
}
