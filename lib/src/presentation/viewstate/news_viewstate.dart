import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reader/src/domain/core/models/news_response_model/news_response_model.dart';
import 'package:reader/src/domain/i_news_repo/i_news_repo.dart';

@injectable
class NewsViewstate extends ChangeNotifier {
  final INewsRepo _newsRepo;
  NewsViewstate(this._newsRepo);

  // Loading
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  NewsResponseModel? _newsResponse;
  NewsResponseModel? get newsResponse => _newsResponse;
  set newsResponse(NewsResponseModel? val) {
    _newsResponse = val;
    notifyListeners();
  }

  getNewsList() async {
    try {
      isLoading = true;
      NewsResponseModel? response = await _newsRepo.getNewsPopular();
      if (response != null) {
        log("${response.toJson()}");
        newsResponse = response;
      }
      isLoading = false;
    } catch (_) {
      isLoading = false;
    }
  }
}
