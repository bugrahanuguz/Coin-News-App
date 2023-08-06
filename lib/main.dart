import 'dart:io';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:coin_news_app/service/coin_service.dart';
import 'package:coin_news_app/service/news_service.dart';
import 'package:coin_news_app/view/splash_screen.dart';
import 'package:coin_news_app/viewmodel/amplitude.dart';
import 'package:coin_news_app/viewmodel/change_screens.dart';
import 'package:coin_news_app/viewmodel/coins_view_model.dart';
import 'package:coin_news_app/viewmodel/firebase_analtyics.dart';
import 'package:coin_news_app/viewmodel/firebase_remote_config.dart';
import 'package:coin_news_app/viewmodel/news_view_model.dart';
import 'package:coin_news_app/viewmodel/qonversion.dart';
import 'package:dio/dio.dart';
import 'package:firebase_app_installations/firebase_app_installations.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'constants/colors.dart';
import 'package:flutter/foundation.dart';

import 'notifications/firebase_messaging.dart';
import 'notifications/local_notifications.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseMessagingService.initialize();

  print('Handling a background message ${message.messageId}');
}

Future<void> requestATTPermissions() async {
  if (Platform.isIOS) {
    // Sadece iOS platformunda bu kodun çalışmasını sağlayın

    TrackingStatus status =
        await AppTrackingTransparency.requestTrackingAuthorization();
    AmplitudeConnection.att_asked();
    FirebaseAnalyticsService.att_asked();
    if (status == TrackingStatus.authorized) {
      AmplitudeConnection.att_success();
      FirebaseAnalyticsService.att_success();
      print('ATT Authorized');
    } else if (status == TrackingStatus.denied) {
      print('ATT Denied');
    } else if (status == TrackingStatus.notSupported) {
      print('ATT not supported on this platform');
    }
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAnalyticsService.init();
  //Firebase Crashlytics
  const fatalError = true;
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  PlatformDispatcher.instance.onError = (error, stack) {
    if (fatalError) {
      // If you want to record a "fatal" exception
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      // ignore: dead_code
    } else {
      // If you want to record a "non-fatal" exception
      FirebaseCrashlytics.instance.recordError(error, stack);
    }
    return true;
  };
  requestATTPermissions();
  // Initialize the messaging and local notification services
  await LocalNotificationService.initialize();
  await FirebaseMessagingService.initialize();
  FirebaseInstallations installations = FirebaseInstallations.instance;
  installations.getToken();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  AmplitudeConnection.connect_amplitude();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black, // Navigation bar color
        systemNavigationBarIconBrightness:
            Brightness.light, // Navigation bar icons' brightness
      ),
    );
    String _coinsBaseUrl = '';
    String _newsBaseUrl = '';
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
