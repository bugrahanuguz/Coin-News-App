import 'package:coin_news_app/viewmodel/amplitude.dart';
import 'package:coin_news_app/viewmodel/firebase_analtyics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import 'local_notifications.dart';

class FirebaseMessagingService {
  static final FirebaseMessaging messaging = FirebaseMessaging.instance;

  static Future initialize() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    await FirebaseAnalyticsService.init();
    AmplitudeConnection.connect_amplitude();
    AmplitudeConnection.notif_asked();
    FirebaseAnalyticsService.notif_asked();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      AmplitudeConnection.notif_success();
      FirebaseAnalyticsService.notif_success();
      print('User granted permission');
    } else {
      print('User declined or has not accepted permission');
    }

    messaging.getToken().then((value) {
      print("Firebase Messaging Token: $value");
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        LocalNotificationService.display(notification);
      }
    });
  }
}
