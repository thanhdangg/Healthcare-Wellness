import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcare_wellness/configs/locator.dart';
import 'package:healthcare_wellness/models/news/news_response_model.dart';
import 'package:healthcare_wellness/utils/enums.dart';

part 'saved_event.dart';
part 'saved_state.dart';

class SavedBloc extends Bloc<SavedEvent, SavedState> {
  final BuildContext context;

  SavedBloc({required this.context}) : super(SavedState.initial()) {
    on<GetSavedArticlesDB>(_getSavedArticlesDB);
    on<UpdateSavedArticlesDB>(_updateSavedArticlesDB);
  }

  Future<void> _getSavedArticlesDB(GetSavedArticlesDB event, Emitter<SavedState> emit) async {
    // Show loading
    emit(state.copyWith(status: BlocStateStatus.loading));
    // get list from DB
    final data = await articleProvider.getAllArticles();
    // mapping Model DB -> Model Article UI
    final savedArticleList =
        data.reversed.map((e) => Article(title: e?.title, description: e?.description, urlToImage: e?.urlToImage,publishedAt: e?.publishedAt)).toList();
    // Emit state
    emit(state.copyWith(status: BlocStateStatus.success, savedArticleList: savedArticleList));
  }

  Future<void> _updateSavedArticlesDB(UpdateSavedArticlesDB event, Emitter<SavedState> emit) async {
    // get list from DB
    final data = await articleProvider.getAllArticles();
    // mapping Model DB -> Model Article UI
    final savedArticleList =
        data.reversed.map((e) => Article(title: e?.title, description: e?.description, urlToImage: e?.urlToImage, publishedAt: e?.publishedAt)).toList();
    // Emit state
    emit(state.copyWith(status: BlocStateStatus.success, savedArticleList: savedArticleList));
  }
}
