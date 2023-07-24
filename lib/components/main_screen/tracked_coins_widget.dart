import 'package:coin_news_app/view/coins_screen.dart';
import 'package:coin_news_app/viewmodel/change_screens.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/text_style.dart';
import '../../model/top_coin_model.dart';
import '../../viewmodel/amplitude.dart';
import '../../viewmodel/coins_view_model.dart';
import '../../viewmodel/firebase_analtyics.dart';
import '../../viewmodel/news_view_model.dart';

class TrackedCoinsWidget extends StatelessWidget {
  const TrackedCoinsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<TopCoinModel?> coinsList =
        context.watch<CoinsViewModel>().trackedCoins;

    return Container(
      alignment: Alignment.centerLeft,
      //height = 120
      height: MediaQuery.of(context).size.height * 0.158,
      child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: [
            trackCoin(coinsList),
            const SizedBox(width: 15),
            trackMoreCoinsWidget(context)
          ]),
    );
  }

  ListView trackCoin(List<TopCoinModel?> coinsList) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: coinsList.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        bool isBTC = Provider.of<CoinsViewModel>(context, listen: false)
            .isBTC(coinsList[index]!);
        final textLength = coinsList[index]!.name!.length;
        return GestureDetector(
          onTap: () {
            //Coins Screene Git.
            AmplitudeConnection.main_screen_tracked_coins_tapped(
                coinsList[index]!.name!);
            FirebaseAnalyticsService.main_screen_tracked_coins_tapped(
                coinsList[index]!.name!);
            Provider.of<NewsViewModel>(context, listen: false)
                .getCoinNews(coinsList[index]!.name!);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CoinsScreen(
                          coin: coinsList[index]!,
                          isBTC: isBTC,
                        )));
          },
          child: Container(
            //width = 120
            width: MediaQuery.of(context).size.width * 0.356,
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: widgetbackground),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  coinsList[index]!.image!,
                  width: 38,
                  height: 38,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: MediaQuery.of(context).size.height * 0.035,
                      child: textLength < 14
                          ? Text(
                              coinsList[index]!.name!,
                              style: boldWhiteTextStyle(18),
                            )
                          : Marquee(
                              text: coinsList[index]!.name!,
                              blankSpace: 20,
                              velocity: 40,
                              pauseAfterRound: Duration(seconds: 2),
                              showFadingOnlyWhenScrolling: true,
                              fadingEdgeStartFraction: 0.1,
                              fadingEdgeEndFraction: 0.1,
                              style: boldWhiteTextStyle(18),
                            ),
                    ),
                    Text(
                      "\$ " +
                          (Provider.of<CoinsViewModel>(context, listen: false)
                              .formatCurrenValue(
                                  coinsList[index]!.currentPrice!)),
                      style: TextStyle(
                          color: positiveValueColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 15);
      },
    );
  }

  GestureDetector trackMoreCoinsWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AmplitudeConnection.track_more_coins_tapped();
        FirebaseAnalyticsService.track_more_coins_tapped();
        context.read<ChangeScreens>().changeScreen(1);
      },
      child: Container(
        width: 140,
        height: 120,
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: widgetbackground),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.add_circle_outline,
              size: 38,
              color: coinNewsColor,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Track",
                  style: boldWhiteTextStyle(18),
                ),
                Text(
                  "More Coins",
                  style: boldWhiteTextStyle(18),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
