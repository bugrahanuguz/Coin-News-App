import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsService {
  static late FirebaseAnalytics analytics;

  FirebaseAnalyticsService._();

  static Future<void> init() async {
    analytics = FirebaseAnalytics.instance;
  }

  static Future<void> home_screen_opened() async {
    await analytics.logEvent(name: 'home_screen_opened');
  }

  static Future<void> explore_screen_opened() async {
    await analytics.logEvent(name: 'explore_screen_opened');
  }

  static Future<void> tracked_coins_screen_opened() async {
    await analytics.logEvent(name: 'tracked_coins_screen_opened');
  }

  //PURCHASE SCREEN
  static Future<void> purchase_screen_viewed() async {
    await analytics.logEvent(name: 'purchase_screen_view');
  }

  static Future<void> purchased_screen_closed() async {
    await analytics.logEvent(name: 'purchased_screen_closed');
  }

  static Future<void> purchased_intended(String source) async {
    print(source);
    await analytics.logEvent(
        name: 'purchased_intended',
        parameters: {'source': source, 'product': 'product'});
  }

  static Future<void> purchased_canceled(String source) async {
    print(source);
    await analytics.logEvent(
        name: 'purchased_canceled',
        parameters: {'source': source, 'product': 'product'});
  }

  static Future<void> purchased(String source) async {
    print(source);
    await analytics.logEvent(
        name: 'purchased',
        parameters: {'source': source, 'product': 'product'});
  }

  //MAİN SCREEN
  static Future<void> main_screen_viewed() async {
    await analytics.logEvent(name: 'main_screen_viewed');
  }

  static Future<void> premium_icon_tapped() async {
    await analytics.logEvent(name: 'premium_icon_tapped');
  }

  static Future<void> track_more_coins_tapped() async {
    await analytics.logEvent(name: 'track_more_coins_tapped');
  }

  static Future<void> main_screen_tracked_coins_tapped(String coin) async {
    await analytics.logEvent(
        name: 'main_screen_tracked_coins_tapped', parameters: {'coin': coin});
  }

  static Future<void> mid_tapped(
      String type, String url, String order, String source) async {
    await analytics.logEvent(name: 'mid_tapped', parameters: {
      'type': type,
      'url': url,
      'order': order,
      'source': source
    });
  }

  static Future<void> cwtw_tapped(String coin) async {
    await analytics.logEvent(name: 'cwtw_tapped', parameters: {'coin': coin});

  }

  //EXPLORE SCREEN
  static Future<void> explore_screen_viewed() async {
    await analytics.logEvent(name: 'explore_screen_viewed');
  }

  static Future<void> search_tab_tapped() async {
    await analytics.logEvent(name: 'search_tab_tapped');
  }

  static Future<void> searched_coin_tapped(String coin) async {
    print(coin);
    await analytics
        .logEvent(name: 'searched_coin_tapped', parameters: {'coin': coin});
  }

  //TRACKED COİNS SCREEN
  static Future<void> tracked_coins_screen_viewed() async {
    await analytics.logEvent(name: 'tracked_coins_screen_viewed');
  }

  static Future<void> tracked_coin_tapped(String coin) async {
    await analytics
        .logEvent(name: 'tracked_coin_tapped', parameters: {'coin': coin});
  }

  //COİNS COİNS SCREEN
  static Future<void> coin_screen_viewed() async {
    await analytics.logEvent(name: 'coin_screen_viewed');
  }

  static Future<void> coin_screen_overview_tapped() async {
    print("overview");
    await analytics.logEvent(name: 'coin_screen_overview_tapped');
  }

  static Future<void> coin_screen_news_view_tapped() async {
    print("news");
    await analytics.logEvent(name: 'coin_screen_news_view_tapped');
  }

  static Future<void> notification_enabled(String coin) async {
    await analytics
        .logEvent(name: 'notification_enabled', parameters: {'coin': coin});
  }

  static Future<void> socials_link_tapped(String coin) async {
    await analytics
        .logEvent(name: 'socials_link_tapped', parameters: {'coin': coin});
  }

  static Future<void> white_paper_link_tapped(String coin) async {
    await analytics
        .logEvent(name: 'white_paper_link_tapped', parameters: {'coin': coin});
  }

  static Future<void> coin_tracked(String coin) async {
    await analytics.logEvent(name: 'coin_tracked', parameters: {'coin': coin});
  }

  static Future<void> notification_disabled(String coin) async {
    await analytics
        .logEvent(name: 'notification_disabled', parameters: {'coin': coin});
  }

  static Future<void> coin_untracked(String coin) async {
    await analytics
        .logEvent(name: 'coin_untracked', parameters: {'coin': coin});
  }

  static Future<void> coin_screen_news_tapped(
      String coin, String type, String url, String order, String source) async {
    await analytics.logEvent(name: 'mid_tapped', parameters: {
      'coin': coin,
      'type': type,
      'url': url,
      'order': order,
      'source': source
    });
  }
}
