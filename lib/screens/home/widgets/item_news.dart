import 'package:flutter/material.dart';
import 'package:healthcare_wellness/models/news/news_model.dart';

class ItemNews extends StatefulWidget {
  final Article article;
  final Function(Article) onTap;
  const ItemNews({super.key, required this.article, required this.onTap});
  
  @override
  State<ItemNews> createState() => _ItemNewsState();
}

class _ItemNewsState extends State<ItemNews> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap(widget.article);
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: const Color(0xFF1E1E1E)),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network(
                  widget.article.urlToImage ?? '',
                  height: 62,
                  width: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 62,
                      width: 80,
                      color: Colors.grey,
                      child: const Icon(
                        Icons.error,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.article.title ?? '',
                        style: const TextStyle(
                            fontSize: 12.0, color: Color(0xff888888)),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        widget.article.content ?? '',
                        style: const TextStyle(
                            fontSize: 16.0,
                            color: Color(0xff888888),
                            fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
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
                const Icon(
                  Icons.bookmark_border,
                  color: Color(0xff888888),
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
