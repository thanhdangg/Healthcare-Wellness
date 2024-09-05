class ArticleSave {
  final int id;
  final String source;
  final String author;
  final String title;
  final String content;
  final String description;
  final String url;
  final String urlToImage;
  final String publishedAt;
 
  const ArticleSave({
    required this.id,
    required this.source,
    required this.author,
    required this.title,
    required this.content,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
  });
  Map<String, Object?> toMap() {
    return {
      'id': id,
      'source': source,
      'author': author,
      'title': title,
      'content': content,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
    };
  }

  @override
  String toString() {
    return 'ArticleSave{id: $id, source: $source, author: $author, title: $title, content: $content, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt}';
  }
}