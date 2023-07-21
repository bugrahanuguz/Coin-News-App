import 'dart:convert';
import 'dart:io';

import 'package:coin_news_app/model/news_model.dart';
import 'package:dio/dio.dart';

class NewsService {
  final Dio dio;

  NewsService(this.dio);

  Future<List<NewsModel?>> getCoinNews(String coinName) async {
    final response = await dio.get("news.php?s=$coinName");
    List<dynamic> coinsList = jsonDecode(response.data);
    if (response.statusCode == HttpStatus.ok) {
      return coinsList.map((coinList) => NewsModel.fromJson(coinList)).toList().take(75).toList();
      
    } else {
      return [];
    }
  }
  Future<int> getCoinNewsCount(String coinName) async {
    final response = await dio.get("news_count.php?s=$coinName");
    
    if (response.statusCode == HttpStatus.ok) {
      return int.parse(response.data.toString());
    } else {
      throw Exception('Failed to load news count');
    }
  }
}