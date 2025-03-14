import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reader/src/domain/core/models/article_model/article_model.dart';
import 'package:reader/src/presentation/core/constants/app_colors.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  const ArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final kSize = MediaQuery.sizeOf(context);
    return Container(
      padding: EdgeInsets.only(bottom: kSize.height * 0.01),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.black,
        boxShadow: [
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.2),
            spreadRadius: 3,
            blurRadius: 7,
            offset: Offset(1, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (article.urlToImage != null)
            CachedNetworkImage(
              height: kSize.height * 0.2,
              width: kSize.width,
              fit: BoxFit.fill,
              imageUrl: article.urlToImage!,
              progressIndicatorBuilder:
                  (context, url, downloadProgress) => Center(
                    child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                      color: AppColors.primaryColor,
                    ),
                  ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          Padding(
            padding: EdgeInsets.only(
              left: kSize.width * 0.02,
              right: kSize.width * 0.02,
              top: kSize.height * 0.01,
            ),
            child: Text(
              article.title!,
              style: TextStyle(fontSize: 14, color: AppColors.white, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: kSize.height * 0.01, horizontal: kSize.width * 0.02),
            child: Text(
              article.content!,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 12, color: AppColors.white, fontWeight: FontWeight.w400),
            ),
          ),
          if (article.author != null)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kSize.width * 0.02),
              child: Text(
                article.author!,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, color: AppColors.grey, fontWeight: FontWeight.w400),
              ),
            ),
          if (article.publishedAt != null) ...{
            Padding(
              padding: EdgeInsets.symmetric(vertical: kSize.height * 0.01, horizontal: kSize.width * 0.02),
              child: Text(
                "Published On : ${DateFormat("dd/MM/yyyy").format(article.publishedAt!)}",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12, color: AppColors.white, fontWeight: FontWeight.w400),
              ),
            ),
          },
        ],
      ),
    );
  }
}
