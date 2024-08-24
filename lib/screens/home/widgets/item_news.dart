import 'package:flutter/material.dart';
import 'package:healthcare_wellness/models/news/news_model.dart';

class ItemNews extends StatefulWidget {
  final Article article;
  const ItemNews({super.key, required this.article});

  @override
  State<ItemNews> createState() => _ItemNewsState();
}

class _ItemNewsState extends State<ItemNews> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: const Color(0xFF1E1E1E)),
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
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.article.title ?? '',
                      style: const TextStyle(fontSize: 12.0, color: Color(0xff888888)),
                    ),
                    Text(
                      widget.article.content ?? '',
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
    );
  }
}
