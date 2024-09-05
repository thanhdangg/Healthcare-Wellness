import 'package:flutter/material.dart';
import 'package:healthcare_wellness/models/news/news_response_model.dart';

class ItemNews extends StatefulWidget {
  final Article article;
  final Function(Article) onTapItem;
  final Function(Article)? onBookmarkItem;
  const ItemNews({
    super.key,
    required this.article,
    required this.onTapItem,
    this.onBookmarkItem,
  });

  @override
  State<ItemNews> createState() => _ItemNewsState();
}

class _ItemNewsState extends State<ItemNews> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTapItem(widget.article),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: const Color(0xFF1E1E1E)),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    widget.article.urlToImage ?? '',
                    height: 62,
                    width: 80,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 62,
                        width: 80,
                        color: Colors.grey,
                        child: const Center(
                          child: Icon(Icons.image_not_supported),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.article.title ?? '',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 12.0, color: Color(0xff888888)),
                      ),
                      Text(
                        widget.article.content ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 16.0, color: Color(0xff888888), fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Text(
                  widget.article.publishedAt ?? '',
                  style: const TextStyle(fontSize: 10, color: Color(0xFF888888)),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(
                    Icons.bookmark_border,
                    color: Color(0xff888888),
                  ),
                  onPressed: () {
                    widget.onBookmarkItem?.call(widget.article);
                  },
                ),
                const SizedBox(width: 12.0),
                const Icon(
                  Icons.more_vert,
                  color: Color(0xff888888),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
