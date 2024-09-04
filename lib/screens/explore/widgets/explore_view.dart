import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthcare_wellness/models/news/news_response_model.dart';
import 'package:healthcare_wellness/screens/explore/bloc/explore_bloc.dart';
import 'package:healthcare_wellness/screens/explore/widgets/category.dart';
import 'package:healthcare_wellness/screens/news_detail/news_detail_page.dart';
import 'package:healthcare_wellness/utils/enums.dart';

class ExploreView extends StatefulWidget {
  // final ExploreState state;
  // const ExploreView({super.key, required this.state});
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  String? _selectedCategory;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  late ExploreBloc _exploreBloc;

  @override
  void initState() {
    super.initState();
    _exploreBloc = BlocProvider.of<ExploreBloc>(context);
    _exploreBloc.add(FetchRecentNews());
    _searchFocusNode.requestFocus();

    // exploreBloc.add(FetchRecommended());
  }

  // TODO: Show Keyboard -> click search icon

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 32.0),
                _buildSearchBar(),
                const SizedBox(height: 8.0),
                _buildCategoryChips(),
                const SizedBox(height: 16.0),
                _buildSectionHeader('Recent News'),
                const SizedBox(height: 8.0),
                _buildRecentNews(),
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
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: TextField(
        controller: _searchController,
        focusNode: _searchFocusNode,
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
    ];
    return SizedBox(
      height: 60,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = _selectedCategory == category.text;
          return ChoiceChip(
            avatar: Icon(
              category.icon,
              color: Colors.white,
            ),
            label: Text(category.text),
            backgroundColor: Colors.grey[900],
            labelStyle: const TextStyle(
              color: Colors.white,
            ),
            selected: isSelected,
            onSelected: (selected) {
              setState(() {
                _selectedCategory = selected ? category.text : null;
              });
              if (selected) {
                _fetchNewsByCategory(category.text);
              }
            },
            selectedColor: Colors.blue,
          );
        },
        separatorBuilder: (context, index) => const SizedBox(width: 16.0),
      ),
    );
  }

  void _fetchNewsByCategory(String category) {
    _exploreBloc.add(FetchNewsByCategory(category: category));
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
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
      ),
    );
  }

  Widget _buildRecentNews() {
    return BlocBuilder<ExploreBloc, ExploreState>(
      bloc: context.read<ExploreBloc>(),
      builder: (context, state) {
        debugPrint('state buildRecentNews: $state');
        if (state.status == BlocStateStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.status == BlocStateStatus.failed) {
          return Center(
            child: Text('Error: ${state.errorMessage}'),
          );
        } else if (state.status == BlocStateStatus.success) {
          final recentNews = state.recentNews;
          debugPrint('recentNews: $recentNews');
          return SizedBox(
            height: 220.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recentNews?.length,
              itemBuilder: (context, index) {
                final article = recentNews![index];
                return _buildNewsCard(article);
              },
            ),
          );
        } else {
          return const Center(child: Text('Unknown state'));
        }
      },
    );
  }

  Widget _buildRecommended(ExploreState state) {
    if (state.status == BlocStateStatus.loading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state.status == BlocStateStatus.failed) {
      return Center(
        child: Text('Error: ${state.errorMessage}'),
      );
    } else if (state.status == BlocStateStatus.success) {
      final recommended = state.recommended;
      debugPrint('recommended: $recommended');
      return SizedBox(
        height: 220.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recommended?.length,
          itemBuilder: (context, index) {
            final article = recommended![index];
            return _buildNewsCard(article);
          },
        ),
      );
    } else {
      return const Center(child: Text('Unknown state'));
    }
  }

  Widget _buildNewsCard(Article article) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NewsDetailPage(article: article),
          ),
        );
      },
      child: Card(
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
      ),
    );
  }
}
