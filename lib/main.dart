import 'package:coin_news_app/service/coin_service.dart';
import 'package:coin_news_app/service/news_service.dart';
import 'package:coin_news_app/view/splash_screen.dart';
import 'package:coin_news_app/viewmodel/change_screens.dart';
import 'package:coin_news_app/viewmodel/coins_view_model.dart';
import 'package:coin_news_app/viewmodel/firebase_remote_config.dart';
import 'package:coin_news_app/viewmodel/news_view_model.dart';
import 'package:coin_news_app/viewmodel/qonversion.dart';
import 'package:dio/dio.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'constants/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: bottomNavBarColor, // Navigation bar color
        systemNavigationBarIconBrightness:
            Brightness.light, // Navigation bar icons' brightness
      ),
    );
    String _coinsBaseUrl = 'http://46.101.103.55:3000';
    String _newsBaseUrl = 'http://coinnewsapp.com/nw/';
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ChangeScreens()),
        ChangeNotifierProvider(create: (context) => QonversionService()),
        ChangeNotifierProvider(
            create: (context) => NewsViewModel(
                service: NewsService(Dio(BaseOptions(baseUrl: _newsBaseUrl))))),
        ChangeNotifierProvider(
            create: (context) => CoinsViewModel(
                service:
                    CoinService(Dio(BaseOptions(baseUrl: _coinsBaseUrl))))),
        ChangeNotifierProvider(
            create: (context) => RemoteConfigService(
                remoteConfig: FirebaseRemoteConfig.instance)),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: backgroundColor,
            useMaterial3: true,
            fontFamily: 'SF Pro Display'),
        home: CustomSplashScreen(),
      ),
    );
  }
}
