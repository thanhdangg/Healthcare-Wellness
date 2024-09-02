import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcare_wellness/models/news/news_response_model.dart';
import 'package:healthcare_wellness/repositories/news_repo.dart';
import 'package:healthcare_wellness/utils/enums.dart';
part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final BuildContext context;

  ExploreBloc({required this.context}) : super(ExploreState.initial()) {
    on<FetchRecentNews>(_onFetchRecentNews);
    on<FetchNewsByCategory>(_onFetchNewsByCategory);

    // on<FetchRecommended>(_onFetchRecommended);
  }

  Future<void> _onFetchRecentNews(FetchRecentNews event, Emitter<ExploreState> emit) async {
    final newsRepository = RepositoryProvider.of<NewsRepository>(context);
    try {
      emit(ExploreState.loading());
      final recentNews = await newsRepository.fetchRecentNews();
      final recommended = await newsRepository.fetchRecommended();
      emit(state.copyWith(
        status: BlocStateStatus.success,
        recentNews: recentNews,
        recommended: recommended,
      ));
    } catch (e) {
      emit(state.copyWith(status: BlocStateStatus.failed, errorMessage: e.toString()));
    }
  }

  Future<void> _onFetchNewsByCategory(FetchNewsByCategory event, Emitter<ExploreState> emit) async {
    final newsRepository = RepositoryProvider.of<NewsRepository>(context);
    emit(ExploreState.loading());
    try {
      final newsByCategory = await newsRepository.fetchNewsByCategory(event.category);
      emit(
        state.copyWith(
          status: BlocStateStatus.success,
          recentNews: newsByCategory,
          recommended: [],
        ),
      );
    } catch (e) {
      emit(state.copyWith(status: BlocStateStatus.failed, errorMessage: e.toString()));
    }
  }

  // Future<void> _onFetchRecommended(
  //     FetchRecommended event, Emitter<ExploreState> emit) async {
  //   try {
  //     emit(ExploreLoading());
  //     final recommended = await newsRepository.fetchRecommended();
  //     emit(ExploreLoaded(recentNews: const [], recommended: recommended));
  //   } catch (e) {
  //     emit(ExploreError(e.toString()));
  //   }
  // }
}
