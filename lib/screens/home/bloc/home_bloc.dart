import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcare_wellness/configs/locator.dart';
import 'package:healthcare_wellness/models/db/article.dart' as db;
import 'package:healthcare_wellness/models/news/news_response_model.dart';
import 'package:healthcare_wellness/repositories/news_repo.dart';
import 'package:healthcare_wellness/utils/enums.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BuildContext context;

  HomeBloc({required this.context}) : super(HomeState.initial()) {
    on<GetNewsDataList>(_getNewsData);
    on<SaveArticleToDB>(_onSaveArticleToDB);
  }

  FutureOr<void> _onSaveArticleToDB(SaveArticleToDB event, Emitter<HomeState> emit) async {
    // convert article -> DB Article
    final article = db.Article(event.article.title, event.article.description);
    // save to db
    final dataSaved = await articleProvider.insert(article);

    if (dataSaved.id != null) {
      emit(state.copyWith(toastStatus: ToastStateStatus.success));
    } else {
      emit(state.copyWith(toastStatus: ToastStateStatus.failed));
    }
  }

  FutureOr<void> _getNewsData(GetNewsDataList event, Emitter<HomeState> emit) async {
    // Show loading
    emit(state.copyWith(status: BlocStateStatus.loading));
    // Waiting to get the list of devices
    final repo = RepositoryProvider.of<NewsRepository>(context);
    final newsData = await repo.getNewsData(
      query: 'generative ai',
      date: TimeOfDay.now().toString(),
    );
    // Emit state
    if (newsData.articles != null) {
      emit(state.copyWith(status: BlocStateStatus.success, articleList: newsData.articles));
    } else {
      emit(state.copyWith(status: BlocStateStatus.failed, articleList: null));
    }
  }
}
