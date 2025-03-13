import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:reader/src/domain/core/models/article_model/article_model.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: article.urlToImage!,
            progressIndicatorBuilder:
                (context, url, downloadProgress) =>
                    CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ],
      ),
    );
  }
}
