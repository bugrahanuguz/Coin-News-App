import 'dart:io';

import 'package:coin_news_app/model/top_coin_model.dart';
import 'package:coin_news_app/service/IService.dart';
import 'package:dio/dio.dart';

class CoinService extends IService {
  CoinService(Dio dio) : super(dio);

  @override
  Future<List<TopCoinModel?>> getTopCoins() async {
    final response = await dio.get(getTopCoinsPath);
    List<dynamic> coinsList = response.data;
    if (response.statusCode == HttpStatus.ok) {
      return coinsList.map((coinList) => TopCoinModel.fromJson(coinList)).toList();
      
    } else {
      return [];
    }
  }
}
