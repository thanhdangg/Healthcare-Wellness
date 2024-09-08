import 'package:flutter/material.dart';
import 'package:healthcare_wellness/models/db/article.dart';

class ItemSave extends StatefulWidget {
  final Article article;
  final Function(Article) onTapItem;

  const ItemSave({
    super.key,
    required this.article,
    required this.onTapItem,
  });

  @override
  State<ItemSave> createState() => _ItemSaveState();
}

class _ItemSaveState extends State<ItemSave> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTapItem(widget.article),
      child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            color:  Color(0xFF1E1E1E),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      widget.article.urlToImage ?? '',
                      fit: BoxFit.cover,
                      width: 62,
                      height: 80,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 62,
                        height: 80,
                        color: Colors.grey,
                        child: const Center(
                          child: Icon(Icons.image_not_supported),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.article.title ?? '',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          widget.article.description ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8.0),
              Text(
                widget.article.publishedAt?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          )),
    );
  }
}
