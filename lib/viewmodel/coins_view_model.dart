import 'dart:convert';

import 'package:coin_news_app/model/top_coin_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../service/IService.dart';

class CoinsViewModel extends ChangeNotifier {
  final IService service;
  CoinsViewModel({required this.service});
  List<TopCoinModel?> coinsList = [];
  List<TopCoinModel?> coinsWatchWeek = [];
  final int itemsPerPage = 50;
  int currentPage = 0;
  List<TopCoinModel?> coinsItems = [];
  List<TopCoinModel?> trackedCoins = [];
  List<TopCoinModel?> filteredCoinsList = [];
  Map<String, bool> _notifications = {};
  bool isNotificationActive(String coinId) => _notifications[coinId] ?? false;

  Future<List<TopCoinModel?>> getCoins() async {
    final data = await service.getTopCoins();
    coinsList = data;
    filteredCoinsList = List.from(coinsList);
    if (coinsList.isNotEmpty) {
      addTrackedCoin(coinsList[0]);
    }
    notifyListeners();
    return coinsList;
  }

  void searchCoins(String searchTerm) {
    if (searchTerm.isEmpty) {
      filteredCoinsList = List.from(coinsList);
    } else {
      List<TopCoinModel?> tempList = [];
      for (TopCoinModel? coin in coinsList) {
        if (coin!.name!.toLowerCase().contains(searchTerm.toLowerCase())) {
          tempList.add(coin);
        }
      }
      filteredCoinsList = tempList;
    }
    notifyListeners();
  }

  void addTrackedCoin(TopCoinModel? coin) {
    if (!isAdded(coin!)) {
      trackedCoins.add(coin);
      if (!isNotificationActive(coin.name!)) { 
      toggleNotification(coin.name!);  
    }
      notifyListeners();
    }
  }

  void removeTrackedCoin(TopCoinModel? coin) {
    trackedCoins.remove(coin);
     if (isNotificationActive(coin!.name!)) {  
    toggleNotification(coin.name!);  
  }
    notifyListeners();
  }

  Future<void> saveTrackedCoins() async {
    final prefs = await SharedPreferences.getInstance();
    final trackedCoinsJson =
        jsonEncode(trackedCoins.map((coin) => coin!.toJson()).toList());
    await prefs.setString('trackedCoins', trackedCoinsJson);
  }

  Future<void> loadTrackedCoins() async {
    final prefs = await SharedPreferences.getInstance();
    final trackedCoinsJson = prefs.getString('trackedCoins');
    if (trackedCoinsJson != null) {
      final List<dynamic> trackedCoinsList = jsonDecode(trackedCoinsJson);
      trackedCoins = trackedCoinsList
          .map((coin) => TopCoinModel.fromJson(Map<String, dynamic>.from(coin)))
          .toList();
    }
  }

  Future<List<TopCoinModel?>> addCoinsToWatchCoins() async {
    coinsWatchWeek = coinsList.sublist(0, 4);
    notifyListeners();
    return coinsWatchWeek;
  }

  void addItems() {
    for (int i = 0; i < itemsPerPage; i++) {
      int index = currentPage * itemsPerPage + i;

      if (index < coinsList.length) {
        coinsItems.add(coinsList[index]);
      } else {
        return;
      }
    }
    print(currentPage);
    currentPage++;
    notifyListeners();
  }

  bool isBTC(TopCoinModel coin) {
    return coin.symbol!.toLowerCase() == 'btc';
  }

  bool isAdded(TopCoinModel coin) {
    for (TopCoinModel? item in trackedCoins) {
      if (item!.id == coin.id) {
        return true;
      }
    }
    return false;
  }

  void toggleNotification(String coinId) {
    _notifications[coinId] = !(_notifications[coinId] ?? false);
    notifyListeners();
  }

  String formatNumber(num num) {
    if (num >= 1000000000000) {
      return '${(num / 1000000000000).toStringAsFixed(2)} Tr';
    } else if (num >= 1000000000) {
      return '${(num / 1000000000).toStringAsFixed(2)} Bn';
    } else if (num >= 1000000) {
      return '${(num / 1000000).toStringAsFixed(2)} Mn';
    } else if (num >= 1000) {
      return '${(num / 1000).toStringAsFixed(2)} K';
    }
    return num.toString();
  }

  String formatCurrenValue(num number) {
    NumberFormat format;
    if (number < 0.1) {
      format = NumberFormat("#,##0.0000000", "en_US");
    } else if (number < 1) {
      format = NumberFormat("#,##0.000000", "en_US");
    } else if (number < 1000) {
      format = NumberFormat("#,##0.00", "en_US");
    } else {
      format = NumberFormat("#,##0.0", "en_US");
    }

    return format.format(number);
  }
}
