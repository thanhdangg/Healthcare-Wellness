import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcare_wellness/models/news/news_response_model.dart';
import 'package:healthcare_wellness/repositories/news_repo.dart';
import 'package:healthcare_wellness/screens/explore/bloc/explore_bloc.dart';
import 'package:healthcare_wellness/screens/explore/bloc/explore_event.dart';
import 'package:healthcare_wellness/screens/explore/bloc/explore_state.dart';

import 'widgets/explore_view.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  late ExploreBloc _exploreBloc;

  @override
  void initState() {
    super.initState();
    final newsRepository = NewsRepository();
    _exploreBloc = ExploreBloc(newsRepository: newsRepository);
    _exploreBloc.add(FetchRecentNews());
    // _exploreBloc.add(FetchRecommended());
  }

  @override
  void dispose() {
    _exploreBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ExploreBloc, ExploreState>(
        builder: (context, state) {
          // return ExploreView(state: state);
          return ExploreView();
        },
      ),
    );
  }
}
