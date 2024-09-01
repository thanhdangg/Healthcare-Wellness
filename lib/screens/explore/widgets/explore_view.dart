import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcare_wellness/models/news/news_response_model.dart';
import 'package:healthcare_wellness/screens/explore/bloc/explore_bloc.dart';
import 'package:healthcare_wellness/screens/explore/bloc/explore_event.dart';
import 'package:healthcare_wellness/screens/explore/bloc/explore_state.dart';
import 'package:healthcare_wellness/screens/explore/widgets/category.dart';

class ExploreView extends StatefulWidget {
  // final ExploreState state;
  // const ExploreView({super.key, required this.state});
  const ExploreView({Key? key}) : super(key: key);

  @override
  _ExploreViewState createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  @override
  void initState() {
    super.initState();
    final exploreBloc = BlocProvider.of<ExploreBloc>(context);
    exploreBloc.add(FetchRecentNews());
    // exploreBloc.add(FetchRecommended());
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16.0),
              _buildSearchBar(),
              const SizedBox(height: 8.0),
              _buildCategoryChips(),
              const SizedBox(height: 16.0),
              _buildSectionHeader('Recent News'),
              const SizedBox(height: 8.0),
              BlocBuilder<ExploreBloc, ExploreState>(
                bloc: context.read<ExploreBloc>(),
                builder: (context, state) {
                  debugPrint('state buildRecentNews: $state');
                  return _buildRecentNews(state);
                },
              ),
              const SizedBox(height: 16.0),
              _buildSectionHeader('Recommended'),
              const SizedBox(height: 8.0),
              BlocBuilder<ExploreBloc, ExploreState>(
                builder: (context, state) {
                  debugPrint('state buildRecommended: $state');
                  return _buildRecommended(state);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search for News',
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        filled: true,
        fillColor: Colors.grey[900],
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildCategoryChips() {
    final List<Category> categories = [
      Category(icon: Icons.category, text: 'Technology'),
      Category(icon: Icons.business, text: 'Business'),
      Category(icon: Icons.cast_for_education_outlined, text: 'Education'),
      Category(icon: Icons.local_hospital, text: 'Health'),
      Category(icon: Icons.local_library, text: 'Education'),
      Category(icon: Icons.local_mall, text: 'Shopping'),
      Category(icon: Icons.restaurant, text: 'Food'),
      Category(icon: Icons.local_pizza, text: 'Food'),
    ];
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Chip(
              avatar: Icon(category.icon, color: Colors.white),
              label: Text(category.text),
              backgroundColor: Colors.grey[900],
              labelStyle: const TextStyle(
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'View more',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRecentNews(ExploreState state) {
    if (state is ExploreLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is ExploreError) {
      return Center(
        child: Text('Error: ${state.message}'),
      );
    } else if (state is ExploreLoaded) {
      final recentNews = state.recentNews;
      debugPrint('recentNews: $recentNews');
      return SizedBox(
        height: 220.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recentNews.length,
          itemBuilder: (context, index) {
            final article = recentNews[index];
            return _buildNewsCard(article);
          },
        ),
      );
    } else {
      return const Center(child: Text('Unknown state'));
    }
  }

  Widget _buildRecommended(ExploreState state) {
    if (state is ExploreLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is ExploreError) {
      return Center(
        child: Text('Error: ${state.message}'),
      );
    } else if (state is ExploreLoaded) {
      final recommended = state.recommended;
      debugPrint('recommended: $recommended');
      return SizedBox(
        height: 220.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recommended.length,
          itemBuilder: (context, index) {
            final article = recommended[index];
            return _buildNewsCard(article);
          },
        ),
      );
    } else {
      return const Center(child: Text('Unknown state'));
    }
  }

  Widget _buildNewsCard(Article article) {
    return Card(
      color: Colors.grey[900],
      child: SizedBox(
        width: 180.0,
        height: 230.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: article.urlToImage != null
                  ? Image.network(
                      article.urlToImage!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: Colors.grey,
                      ),
                    )
                  : Container(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.author ?? '',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12.0,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    article.title ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4.0),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          article.publishedAt ?? '',
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.bookmark_border,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
