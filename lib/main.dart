import 'package:coin_news_app/service/coin_service.dart';
import 'package:coin_news_app/view/splash_screen.dart';
import 'package:coin_news_app/viewmodel/change_screens.dart';
import 'package:coin_news_app/viewmodel/coins_view_model.dart';
import 'package:coin_news_app/viewmodel/qonversion.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String _baseUrl = 'http://46.101.103.55:3000';
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChangeScreens()),
        ChangeNotifierProvider(create: (context) => QonversionService()),
        ChangeNotifierProvider(create: (context) => CoinsViewModel(service: CoinService(Dio(BaseOptions(baseUrl: _baseUrl))))),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: backgroundColor,
            useMaterial3: true,
            fontFamily: 'SF Pro Display'),
        home:  CustomSplashScreen(),
      ),
    );
  }
}
