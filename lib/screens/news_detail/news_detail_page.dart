import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:healthcare_wellness/models/news/news_response_model.dart';

@RoutePage()
class NewsDetailPage extends StatefulWidget {
  final Article article;
  const NewsDetailPage({super.key, required this.article});

  @override
  State<NewsDetailPage> createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  @override
  Widget build(BuildContext context) {
    return NewsDetailView(article: widget.article); 
  }
}

class NewsDetailView extends StatefulWidget {
  final Article article;

  const NewsDetailView({super.key, required this.article}); 

  @override
  State<NewsDetailView> createState() => _NewsDetailViewState();
}

class _NewsDetailViewState extends State<NewsDetailView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bookmark_border,
              color: Colors.white,
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
      body: Column(
        children: [
          Image.network(
            widget.article.urlToImage ?? '',
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 200,
                width: double.infinity,
                color: Colors.grey,
                child: const Icon(
                  Icons.error,
                  color: Colors.white,
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.tips_and_updates,
                      weight: 12.0,
                      size: 12.0,
                      color: Color.fromARGB(255, 222, 160, 233),
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      widget.article.source?.name ?? '',
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Color.fromARGB(255, 222, 160, 233),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
                Text(
                  widget.article.title ?? '',
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  widget.article.author ?? '',
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  widget.article.publishedAt ?? '',
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.facebook,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.inbox,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.link,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Text(
                  widget.article.description ?? '',
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  widget.article.content ?? '',
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}