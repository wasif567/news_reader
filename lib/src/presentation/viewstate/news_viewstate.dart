import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:reader/src/domain/core/models/news_response_model/news_response_model.dart';
import 'package:reader/src/domain/i_news_repo/i_news_repo.dart';

@injectable
class NewsViewstate extends ChangeNotifier {
  final INewsRepo _newsRepo;
  NewsViewstate(this._newsRepo);

  TextEditingController searchController = TextEditingController();

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

  Future getNewsPopular() async {
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

  Future getRecentNewsList() async {
    try {
      isLoading = true;
      NewsResponseModel? response = await _newsRepo.getNewsRecent(
        query: "tesla",
        sortDateTime: DateTime.now().subtract(const Duration(days: 1)),
      );
      if (response != null) {
        log("${response.toJson()}");
        newsResponse = response;
      }
      isLoading = false;
    } catch (_) {
      isLoading = false;
    }
  }

  Future getBusinessNewsList() async {
    try {
      isLoading = true;
      NewsResponseModel? response = await _newsRepo.getNewsBusiness();
      if (response != null) {
        log("${response.toJson()}");
        newsResponse = response;
      }
      isLoading = false;
    } catch (_) {
      isLoading = false;
    }
  }

  Future getTopHeadlineNews() async {
    try {
      isLoading = true;
      NewsResponseModel? response = await _newsRepo.getTopHeadlineNews();
      if (response != null) {
        log("${response.toJson()}");
        newsResponse = response;
      }
      isLoading = false;
    } catch (_) {
      isLoading = false;
    }
  }

  Future getWallStreetNews() async {
    try {
      isLoading = true;
      NewsResponseModel? response = await _newsRepo.getWallStreetNews();
      if (response != null) {
        log("${response.toJson()}");
        newsResponse = response;
      }
      isLoading = false;
    } catch (_) {
      isLoading = false;
    }
  }

  getNews(int index) async {
    if (index == 0) {
      await getNewsPopular();
    } else if (index == 1) {
      await getRecentNewsList();
    } else if (index == 2) {
      await getBusinessNewsList();
    } else if (index == 3) {
      await getTopHeadlineNews();
    } else {
      await getWallStreetNews();
    }
  }

  getPopularNews() async {
    try {
      isLoading = true;
      NewsResponseModel? response = await _newsRepo.getNewsPopular();
      if (response != null) {
        log("${response.toJson()}");
        newsResponse = response;
      }
      isLoading = false;
    } catch (_) {}
  }
}
