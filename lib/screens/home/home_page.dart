import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcare_wellness/configs/app_router.dart';
import 'package:healthcare_wellness/screens/home/bloc/home_bloc.dart';
import 'package:healthcare_wellness/screens/home/widgets/item_news.dart';
import 'package:healthcare_wellness/utils/enums.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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
          actions: [
            // search
            SizedBox(
              width: 44.0,
              height: 44.0,
              child: IconButton(
                onPressed: () {
                  context.tabsRouter.setActiveIndex(1);
                },
                icon: const Icon(Icons.search_outlined),
                color: Colors.white,
                iconSize: 24,
              ),
            ),
            // notification
            const SizedBox(
              width: 44.0,
              height: 44.0,
              child: Icon(
                Icons.notifications_outlined,
                color: Colors.white,
                size: 24,
              ),
            ),
            // avatar
            const SizedBox(
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
            const SizedBox(width: 8.0)
          ],
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state.toastStatus != null) {
              final snackBar = SnackBar(
                content: Text('${state.toastStatus?.message}'),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
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
                          onBookmarkItem: (article) async {
                            _homeBloc.add(SaveArticleToDB(article: article));
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
    final highlightItems = state.articleList ?? [];

    final pageController = PageController();

    return Container(
      height: 180,
      margin: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: highlightItems.isEmpty
          ? const SizedBox.expand()
          : Stack(
              alignment: Alignment.center,
              children: [
                PageView.builder(
                  controller: pageController,
                  // itemCount: highlightItems.length,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    final item = highlightItems[index];
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Stack(
                        children: [
                          Image.network(
                            item.urlToImage ?? '',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: double.infinity,
                                height: double.infinity,
                                color: Colors.grey,
                                child: const Icon(
                                  Icons.error,
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: <Color>[
                                  Colors.black.withOpacity(0.95),
                                  Colors.black.withOpacity(0.5),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Padding(
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
                                          item.author ?? '',
                                          maxLines: 1,
                                          style: const TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.normal,
                                              color: Color(0xffe8e8e8)),
                                        ),
                                        const SizedBox(height: 4.0),
                                        Text(
                                          item.title ?? '',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 16.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 8.0),
                                  IconButton(
                                    onPressed: () {
                                      context.router.push(NewsDetailRoute(article: item));
                                    },
                                    icon: const Icon(
                                      Icons.open_in_new,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
                Positioned(
                  top: 8.0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: SmoothPageIndicator(
                      controller: pageController,
                      // count: highlightItems.length,
                      count: 5,
                      effect: const ExpandingDotsEffect(
                        dotHeight: 8.0,
                        dotWidth: 8.0,
                        activeDotColor: Colors.white,
                        dotColor: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
