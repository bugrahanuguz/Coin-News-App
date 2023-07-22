import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class RemoteConfigService extends ChangeNotifier {
  final FirebaseRemoteConfig _remoteConfig;

  RemoteConfigService({required FirebaseRemoteConfig remoteConfig})
      : _remoteConfig = remoteConfig;

  Future initialize() async {
    try {
      // Enable developer mode to relax fetch frequency limit
      await _remoteConfig.setConfigSettings(RemoteConfigSettings(
        fetchTimeout: const Duration(seconds: 10),
        minimumFetchInterval: const Duration(hours: 1),
      ));

      // Fetch config
      await fetchConfig();
    } catch (e) {
      print('Remote config fetch failed: $e');
    }
  }

  Future fetchConfig() async {
    await _remoteConfig.fetchAndActivate();
  }

  Future<List<Map<String, dynamic>>> fetchCoins(String key) async {
    try {
      // 'coins' anahtarının değerini çeker
      String coinsString = await _remoteConfig.getString(key);

      // Çekilen değeri JSON'a parse eder
      List<dynamic> coinsJson = jsonDecode(coinsString);

      // JSON veriyi bir liste halinde döndürür
      return coinsJson.cast<Map<String, dynamic>>();
    } catch (e) {
      // Hata durumunda, hata mesajını yazdırır ve boş bir liste döndürür
      print('Failed to load coins: $e');
      return [];
    }
  }

  String getString(String key) {
    return _remoteConfig.getString(key);
  }

  bool getBool(String key) {
    return _remoteConfig.getBool(key);
  }

  int getInt(String key) {
    return _remoteConfig.getInt(key);
  }

  double getDouble(String key) {
    return _remoteConfig.getDouble(key);
  }
}
