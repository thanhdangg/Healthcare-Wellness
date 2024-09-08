import 'package:flutter/material.dart';
import 'package:healthcare_wellness/models/news/news_response_model.dart';
import 'package:healthcare_wellness/screens/news_detail/news_detail_page.dart';

class ItemExplore extends StatefulWidget {
  final Article article;
  final Function(Article) onTapItem;
  final Function(Article)? onBookmarkItem;


  const ItemExplore({
    Key? key,
    required this.article,
    required this.onTapItem,
    required this.onBookmarkItem,
  }) : super(key: key);

  @override
  State<ItemExplore> createState() => _ItemExploreState();
}
class _ItemExploreState extends State<ItemExplore> {
  @override
  Widget build(BuildContext context) {
    return _buildNewsCard(widget.article);
  }

  Widget _buildNewsCard(Article article) {
    return GestureDetector(
      onTap: () => widget.onTapItem(article),
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
                          onPressed: () {
                           widget.onBookmarkItem!(article);
                          },
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
