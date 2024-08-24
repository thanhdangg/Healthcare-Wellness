import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcare_wellness/models/news/news_model.dart';
import 'package:healthcare_wellness/repositories/news_response_model.dart';
import 'package:healthcare_wellness/utils/enums.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BuildContext context;

  HomeBloc({required this.context}) : super(HomeState.initial()) {
    on<GetDeviceList>(_getNewsData);
  }

  FutureOr<void> _getNewsData(
      GetDeviceList event, Emitter<HomeState> emit) async {
    // Show loading
    emit(state.copyWith(status: BlocStateStatus.loading));
    // Waiting to get the list of devices
    final repo = RepositoryProvider.of<NewsResponseModel>(context);
    final newsData = await repo.getNewsData(
      query: 'facebook',
      from: '2024-07-24',
      sortBy: 'publishedAt',
      apiKey: '8327c8b7feff4d5cbe24f280c1e7f455',
    );
    // Emit state
    if (newsData.articles != null) {
      emit(state.copyWith(
          status: BlocStateStatus.success, articleList: newsData.articles));
    } else {
      emit(state.copyWith(status: BlocStateStatus.failed, articleList: null));
    }
  }
}
