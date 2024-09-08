import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcare_wellness/configs/app_router.dart';
import 'package:healthcare_wellness/models/news/news_response_model.dart';
import 'package:healthcare_wellness/screens/saved/bloc/saved_bloc.dart';
import 'package:healthcare_wellness/screens/saved/widgets/item_save.dart';
import 'package:healthcare_wellness/utils/enums.dart';
import 'package:healthcare_wellness/models/db/article.dart' as db;

@RoutePage()
class SavedPage extends StatefulWidget {
  const SavedPage({super.key});

  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> {
  late SavedBloc _savedBloc;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _savedBloc = BlocProvider.of<SavedBloc>(context);
    _savedBloc.add(GetSavedArticlesDB());
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: BlocBuilder<SavedBloc, SavedState>(builder: (context, state) {
          if (state.status == BlocStateStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Container(
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Saved Articles',
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListView.separated(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 16.0),
                        itemCount: state.savedArticleList?.length ?? 0,
                        controller: _scrollController,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 12.0),
                        itemBuilder: (BuildContext context, int index) {
                          final article = state.savedArticleList?[index];
                          final articleDB = db.Article(
                            title: article?.title ?? '',
                            description: article?.description ?? '',
                            urlToImage: article?.urlToImage ?? '',
                            publishedAt: article?.publishedAt ?? '',
                          );
                          final articleRepository = Article(
                            title: article?.title,
                            description: article?.description,
                            urlToImage: article?.urlToImage,
                            publishedAt: article?.publishedAt,
                          );
                          return ItemSave(
                            article: articleDB,
                            onTapItem: (article) {
                              context.router.push(
                                  NewsDetailRoute(article: articleRepository));
                            },
                          );
                        },
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: 1,
                    physics: const BouncingScrollPhysics(),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
