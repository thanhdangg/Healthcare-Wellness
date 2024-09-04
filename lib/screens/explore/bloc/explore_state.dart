part of 'explore_bloc.dart';

class ExploreState {
  final BlocStateStatus status;
  final List<Article>? recentNews;
  final List<Article>? recommended;
  final String? errorMessage;

  ExploreState({
    required this.status,
    this.recentNews,
    this.recommended,
    this.errorMessage,
  });
  factory ExploreState.initial() => ExploreState(
        status: BlocStateStatus.initial,
        recentNews: null,
        recommended: null,
      );
  factory ExploreState.loading() => ExploreState(
        status: BlocStateStatus.loading,
        recentNews: null,
        recommended: null,
      );
  ExploreState copyWith({
    BlocStateStatus? status,
    List<Article>? recentNews,
    List<Article>? recommended,
    String? errorMessage,
  }) {
    return ExploreState(
      status: status ?? this.status,
      recentNews: recentNews ?? this.recentNews,
      recommended: recommended ?? this.recommended,
      errorMessage: errorMessage,
    );
  }
}
