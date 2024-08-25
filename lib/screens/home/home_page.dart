import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcare_wellness/configs/app_router.dart';
import 'package:healthcare_wellness/screens/home/bloc/home_bloc.dart';
import 'package:healthcare_wellness/screens/home/widgets/item_news.dart';
import 'package:healthcare_wellness/utils/enums.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key, this.title});

  final String? title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc _homeBloc;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _homeBloc.add(GetNewsDataList());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          leading: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          backgroundColor: Colors.black,
          actions: const [
            // search
            SizedBox(
              width: 44.0,
              height: 44.0,
              child: Icon(
                Icons.search_outlined,
                color: Colors.white,
                size: 24,
              ),
            ),
            // notification
            SizedBox(
              width: 44.0,
              height: 44.0,
              child: Icon(
                Icons.notifications_outlined,
                color: Colors.white,
                size: 24,
              ),
            ),
            // avatar
            SizedBox(
              width: 44.0,
              height: 44.0,
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Colors.amber,
                  maxRadius: 14.0,
                  child: Text('N'),
                ),
              ),
            ),
            // Spacing right
            SizedBox(width: 8.0)
          ],
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.status == BlocStateStatus.loading && state.articleList == null) {
              return const Center();
            }
            return SizedBox(
              height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // carousel
                    _buildCarouselPage(state),
                    // heading bar
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Top stories',
                            style: TextStyle(
                                color: Color(0xFFE8E8E8),
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Text(
                            'See all',
                            style: TextStyle(
                                color: Color(0xFF888888),
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    // top stories content
                    ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                      controller: _scrollController,
                      separatorBuilder: (context, index) => const SizedBox(height: 12.0),
                      itemBuilder: (context, index) {
                        final article = state.articleList?[index];
                        return ItemNews(
                          article: article!,
                          onTapItem: (article) {
                            context.router.push(NewsDetailRoute(article: article));
                          },
                        );
                      },
                      itemCount: state.articleList?.length ?? 0,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCarouselPage(HomeState state) {
    final highlightItem =
        state.articleList == null || state.articleList!.isEmpty ? null : state.articleList!.first;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      height: 180,
      margin: const EdgeInsets.all(16.0),
      child: highlightItem == null
          ? const SizedBox.expand()
          : Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // media
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    width: double.infinity,
                    height: double.infinity,
                    highlightItem.urlToImage ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
                // overlay foreground
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: <Color>[
                        Colors.black.withOpacity(0.95),
                        Colors.black.withOpacity(0.5),
                        Colors.transparent,
                      ], // Gradient from
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              highlightItem.author ?? '',
                              maxLines: 1,
                              style: const TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xffe8e8e8e)),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              highlightItem.title ?? '',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      const Icon(
                        Icons.open_in_new,
                        color: Colors.white,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
