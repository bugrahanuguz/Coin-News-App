import 'package:coin_news_app/constants/text_style.dart';
import 'package:coin_news_app/viewmodel/amplitude.dart';
import 'package:coin_news_app/viewmodel/news_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/colors.dart';
import '../../model/top_coin_model.dart';
import '../../view/coins_screen.dart';
import '../../viewmodel/coins_view_model.dart';
import '../../viewmodel/firebase_analtyics.dart';

class CoinstoWatchWidget extends StatelessWidget {
  const CoinstoWatchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<TopCoinModel?> coinsList =
        context.read<CoinsViewModel>().coinsWatchWeek;
    return Container(
      alignment: Alignment.centerLeft,
      //height = 80
      height: MediaQuery.of(context).size.height * 0.105,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: coinsList.length,
        itemBuilder: (BuildContext context, index) {
          bool isBTC = Provider.of<CoinsViewModel>(context, listen: false)
              .isBTC(coinsList[index]!);
          return GestureDetector(
            onTap: () {
              AmplitudeConnection.cwtw_tapped(coinsList[index]!.name!);
              FirebaseAnalyticsService.cwtw_tapped(coinsList[index]!.name!);
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
              //width = 91
              width: MediaQuery.of(context).size.width * 0.227,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: widgetbackground,
                  borderRadius: BorderRadius.circular(9.7)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(
                    coinsList[index]!.image!,
                    width: 32,
                    height: 32,
                  ),
                  Text(
                    coinsList[index]!.name!,
                    style: boldWhiteTextStyle(14),
                  ),
                  Text(
                    "\$ " +
                        (Provider.of<CoinsViewModel>(context, listen: false)
                            .formatCurrenValue(
                                coinsList[index]!.currentPrice!)),
                    style: TextStyle(
                        color: negativeValueColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, index) {
          return const SizedBox(width: 5);
        },
      ),
    );
  }
}
