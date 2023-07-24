import 'package:amplitude_flutter/amplitude.dart';

class AmplitudeConnection {
  static late Amplitude amplitude;

  static Future<void> connect_amplitude() async {
    amplitude = Amplitude.getInstance();
    amplitude.init("603c86f2cd1ce1864ef0ee7949b0b839");
  }

  static Future<void> home_screen_opened() async {
    await amplitude.logEvent('home_screen_opened');
  }

  static Future<void> explore_screen_opened() async {
    await amplitude.logEvent('explore_screen_opened');
  }

  static Future<void> tracked_coins_screen_opened() async {
    await amplitude.logEvent('tracked_coins_screen_opened');
  }

  //PURCHASE SCREEN
  static Future<void> purchase_screen_viewed() async {
    await amplitude.logEvent('purchase_screen_view');
  }

  static Future<void> purchased_screen_closed() async {
    await amplitude.logEvent('purchased_screen_closed');
  }

  static Future<void> purchased_intended(String source) async {
    print(source);
    await amplitude.logEvent('purchased_intended',
        eventProperties: {'source': source, 'product': 'product'});
  }

  static Future<void> purchased_canceled(String source) async {
    print(source);
    await amplitude.logEvent('purchased_canceled',
        eventProperties: {'source': source, 'product': 'product'});
  }

  static Future<void> purchased(String source) async {
    print(source);
    await amplitude.logEvent('purchased',
        eventProperties: {'source': source, 'product': 'product'});
  }

  //MAİN SCREEN
  static Future<void> main_screen_viewed() async {
    await amplitude.logEvent('main_screen_viewed');
  }

  static Future<void> premium_icon_tapped() async {
    await amplitude.logEvent('premium_icon_tapped');
  }

  static Future<void> track_more_coins_tapped() async {
    await amplitude.logEvent('track_more_coins_tapped');
  }

  static Future<void> main_screen_tracked_coins_tapped(String coin) async {
    await amplitude.logEvent('main_screen_tracked_coins_tapped',
        eventProperties: {'coin': coin});
  }

  static Future<void> mid_tapped(
      String type, String url, String order, String source) async {
    await amplitude.logEvent('mid_tapped', eventProperties: {
      'type': type,
      'url': url,
      'order': order,
      'source': source
    });
  }

  static Future<void> cwtw_tapped(String coin) async {
    await amplitude.logEvent('cwtw_tapped', eventProperties: {'coin': coin});
  }

  //EXPLORE SCREEN
  static Future<void> explore_screen_viewed() async {
    await amplitude.logEvent('explore_screen_viewed');
  }

  static Future<void> search_tab_tapped() async {
    await amplitude.logEvent('search_tab_tapped');
  }

  static Future<void> searched_coin_tapped(String coin) async {
    print(coin);
    await amplitude
        .logEvent('searched_coin_tapped', eventProperties: {'coin': coin});
  }

  //TRACKED COİNS SCREEN
  static Future<void> tracked_coins_screen_viewed() async {
    await amplitude.logEvent('tracked_coins_screen_viewed');
  }

  static Future<void> tracked_coin_tapped(String coin) async {
    await amplitude
        .logEvent('tracked_coin_tapped', eventProperties: {'coin': coin});
  }

  //COİNS COİNS SCREEN
  static Future<void> coin_screen_viewed() async {
    await amplitude.logEvent('coin_screen_viewed');
  }

  static Future<void> coin_screen_overview_tapped() async {
    print("overview");
    await amplitude.logEvent('coin_screen_overview_tapped');
  }

  static Future<void> coin_screen_news_view_tapped() async {
    print("news");
    await amplitude.logEvent('coin_screen_news_view_tapped');
  }

  static Future<void> notification_enabled(String coin) async {
    await amplitude
        .logEvent('notification_enabled', eventProperties: {'coin': coin});
  }

  static Future<void> socials_link_tapped(String coin) async {
    await amplitude
        .logEvent('socials_link_tapped', eventProperties: {'coin': coin});
  }

  static Future<void> white_paper_link_tapped(String coin) async {
    await amplitude
        .logEvent('white_paper_link_tapped', eventProperties: {'coin': coin});
  }

  static Future<void> coin_tracked(String coin) async {
    await amplitude.logEvent('coin_tracked', eventProperties: {'coin': coin});
  }

  static Future<void> notification_disabled(String coin) async {
    await amplitude
        .logEvent('notification_disabled', eventProperties: {'coin': coin});
  }

  static Future<void> coin_untracked(String coin) async {
    await amplitude.logEvent('coin_untracked', eventProperties: {'coin': coin});
  }

  static Future<void> coin_screen_news_tapped(
      String coin, String type, String url, String order, String source) async {
    await amplitude.logEvent('mid_tapped', eventProperties: {
      'coin': coin,
      'type': type,
      'url': url,
      'order': order,
      'source': source
    });
  }
}
