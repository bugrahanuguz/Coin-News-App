import 'package:coin_news_app/model/top_coin_model.dart';
import 'package:dio/dio.dart';

abstract class IService {
  final Dio dio;

  IService(this.dio);

  final String getTopCoinsPath = ILoginServicePath.GETTOPCOIN.rawValue;

  Future<List<TopCoinModel?>> getTopCoins();

}

enum ILoginServicePath {
  GETTOPCOIN,
}

extension ILoginServicePathExtension on ILoginServicePath {
  String get rawValue {
    switch (this) {
      case ILoginServicePath.GETTOPCOIN:
        return '/getTopCoins';
    }
  }
}
