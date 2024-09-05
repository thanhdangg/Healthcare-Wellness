part of 'saved_bloc.dart';

class SavedState {
  final BlocStateStatus status;
  final ToastStateStatus? toastStatus;
  final List<Article>? savedArticleList;

  SavedState({
    required this.status,
    this.savedArticleList,
    this.toastStatus,
  });

  factory SavedState.initial() => SavedState(
        status: BlocStateStatus.initial,
        savedArticleList: [],
        toastStatus: null,
      );

  SavedState copyWith({
    BlocStateStatus? status,
    List<Article>? savedArticleList,
    ToastStateStatus? toastStatus,
  }) {
    return SavedState(
      status: status ?? this.status,
      savedArticleList: savedArticleList ?? this.savedArticleList,
      toastStatus: toastStatus,
    );
  }
}
