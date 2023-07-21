import 'package:coin_news_app/model/news_model.dart';
import 'package:coin_news_app/service/news_service.dart';
import 'package:flutter/material.dart';

class NewsViewModel extends ChangeNotifier {
  final NewsService service;

  NewsViewModel({required this.service});
  List<NewsModel?> newsList = [];
  int newsCount = 0;
    final int itemsPerPage = 50;
  int currentPage = 0;
  List<NewsModel?> newsItems = [];

  Future<List<NewsModel?>> getCoinNews(String coinName) async {
    final data = await service.getCoinNews(coinName);
    newsList = data;
    notifyListeners();
    return newsList;
  }
    void addItems() {
    for (int i = 0; i < itemsPerPage; i++) {
      int index = currentPage * itemsPerPage + i;

      if (index < newsList.length) {
        newsItems.add(newsList[index]);
      } else {
        return;
      }
    }
    
    print(currentPage);
    currentPage++;
    notifyListeners();
  }

  String timeAgo(String date) {
    DateTime publicationDate = DateTime.parse(date).toLocal();
    Duration difference = DateTime.now().difference(publicationDate);

    if (difference.inHours < 24) {
      return "${difference.inHours} hours ago";
    } else {
      return "${difference.inDays} days ago";
    }
  }
}
