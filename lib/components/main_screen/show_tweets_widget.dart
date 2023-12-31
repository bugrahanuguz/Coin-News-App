import 'package:coin_news_app/viewmodel/amplitude.dart';
import 'package:coin_news_app/viewmodel/firebase_analtyics.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/text_style.dart';
import '../../model/top_coin_model.dart';

class ShowTweetsWidget extends StatelessWidget {
  const ShowTweetsWidget({
    super.key,
    required this.isTappedMid,
    this.coin,
    required this.orderIndex,
  });
  final isTappedMid;
  final TopCoinModel? coin;
  final String orderIndex;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //APİ GÜNCELLENİNCE GÜNCELLECEK !!!!!!!!!!!!!!!!!!!!!!
        if (isTappedMid == true) {
          AmplitudeConnection.mid_tapped("tweets", "url", orderIndex, "source");
          AmplitudeConnection.webview_link_opened();
          FirebaseAnalyticsService.webview_link_opened();
          FirebaseAnalyticsService.mid_tapped(
              "tweets", "url", orderIndex, "source");
        } else {
          AmplitudeConnection.webview_link_opened();
          FirebaseAnalyticsService.webview_link_opened();
          AmplitudeConnection.coin_screen_news_tapped(
              coin!.name!, "tweets", "url", orderIndex, "source");
          FirebaseAnalyticsService.coin_screen_news_tapped(
              coin!.name!, "tweets", "url", orderIndex, "source");
        }
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.92,
        height: MediaQuery.of(context).size.height * 0.264,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: widgetbackground, borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.white,
                ),
                Column(
                  children: [
                    Text(
                      "jack",
                      style: tweetTextStyle(15),
                    ),
                    Text(
                      "@jack",
                      style: tweetTextStyle(14),
                    ),
                  ],
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.53),
                Image.asset("assets/twitter_logo.png")
              ],
            ),
            const SizedBox(height: 10),
            Text(
              "#eth",
              style: tweetTextStyle(15),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.085),
            const Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "18 days ago",
                style: TextStyle(
                    color: Color(0xFF7A7A7A),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
