import 'dart:convert';

import 'package:reader/src/domain/core/models/article_model/article_model.dart';

NewsResponseModel newsResponseModelFromJson(String str) => NewsResponseModel.fromJson(json.decode(str));

String newsResponseModelToJson(NewsResponseModel data) => json.encode(data.toJson());

class NewsResponseModel {
  String status;
  int totalResults;
  List<Article> articles;

  NewsResponseModel({required this.status, required this.totalResults, required this.articles});

  factory NewsResponseModel.fromJson(Map<String, dynamic> json) => NewsResponseModel(
    status: json["status"],
    totalResults: json["totalResults"],
    articles: Article.fromJsonList(json["articles"]),
  );

  Map<String, dynamic> toJson() => {"status": status, "totalResults": totalResults, "articles": articles};
}
