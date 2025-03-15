import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:reader/src/domain/core/internet_service/i_base_client.dart';
import 'package:reader/src/domain/core/models/news_response_model/news_response_model.dart';
import 'package:reader/src/domain/i_news_repo/i_news_repo.dart';

@LazySingleton(as: INewsRepo)
class NewsRepo extends INewsRepo {
  final IBaseClient client;
  NewsRepo(this.client);

  @override
  Future getNewsPopular() async {
    try {
      DateFormat format = DateFormat("yyyy-MM-dd");
      String date = format.format(DateTime.now().subtract(const Duration(days: 1)));
      String url =
          "everything?q=apple&from=$date&to=$date&sortBy=popularity&apiKey=32a87bb58a9141378459f565a956442a";
      final response = await client.get(url).timeout(const Duration(seconds: 60));
      if (response.statusCode == 200) {
        final decode = json.decode(response.body);
        return NewsResponseModel.fromJson(decode);
      } else {
        return null;
      }
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future getNewsBusiness() async {
    try {
      String url = "top-headlines?country=us&category=business&apiKey=32a87bb58a9141378459f565a956442a";
      final response = await client.get(url).timeout(const Duration(seconds: 60));
      if (response.statusCode == 200) {
        final decode = json.decode(response.body);
        return NewsResponseModel.fromJson(decode);
      } else {
        return null;
      }
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future getNewsRecent({required DateTime sortDateTime, required String query}) async {
    try {
      DateFormat format = DateFormat("yyyy-MM-dd");
      String date = format.format(sortDateTime);
      String url =
          "everything?q=$query&from=$date&sortBy=publishedAt&apiKey=32a87bb58a9141378459f565a956442a";
      final response = await client.get(url).timeout(const Duration(seconds: 60));
      if (response.statusCode == 200) {
        final decode = json.decode(response.body);
        return NewsResponseModel.fromJson(decode);
      } else {
        return null;
      }
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future getTopHeadlineNews() async {
    try {
      String url = "top-headlines?sources=techcrunch&apiKey=32a87bb58a9141378459f565a956442a";
      final response = await client.get(url).timeout(const Duration(seconds: 60));
      if (response.statusCode == 200) {
        final decode = json.decode(response.body);
        return NewsResponseModel.fromJson(decode);
      } else {
        return null;
      }
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future getWallStreetNews() async {
    try {
      String url = "everything?domains=wsj.com&apiKey=32a87bb58a9141378459f565a956442a";
      final response = await client.get(url).timeout(const Duration(seconds: 60));
      if (response.statusCode == 200) {
        final decode = json.decode(response.body);
        return NewsResponseModel.fromJson(decode);
      } else {
        return null;
      }
    } catch (_) {
      rethrow;
    }
  }
}
