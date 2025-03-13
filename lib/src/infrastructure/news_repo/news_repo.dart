import 'dart:convert';

import 'package:injectable/injectable.dart';
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
      String url =
          "everything?q=apple&from=2025-03-11&to=2025-03-11&sortBy=popularity&apiKey=32a87bb58a9141378459f565a956442a";
      final response = await client.get(url).timeout(const Duration(seconds: 60));
      if (response.statusCode == 200) {
        final decode = json.decode(response.body);
        return NewsResponseModel.fromJson(decode);
      }
    } catch (_) {
      rethrow;
    }
  }
}
