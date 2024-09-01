import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcare_wellness/repositories/news_repo.dart';
import 'explore_event.dart';
import 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final NewsRepository newsRepository;

  ExploreBloc({required this.newsRepository}) : super(ExploreInitial()) {
    on<FetchRecentNews>(_onFetchRecentNews);
    // on<FetchRecommended>(_onFetchRecommended);
  }

  Future<void> _onFetchRecentNews(
      FetchRecentNews event, Emitter<ExploreState> emit) async {
    try {
      emit(ExploreLoading());
      final recentNews = await newsRepository.fetchRecentNews();
      final recommended = await newsRepository.fetchRecommended();
      emit(ExploreLoaded(recentNews: recentNews, recommended: recommended));
    } catch (e) {
      emit(ExploreError(e.toString()));
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
