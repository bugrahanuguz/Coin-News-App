import 'package:coin_news_app/model/top_coin_model.dart';
import 'package:coin_news_app/view/coins_screen.dart';
import 'package:coin_news_app/view/purchase_screen.dart';
import 'package:coin_news_app/viewmodel/coins_view_model.dart';
import 'package:coin_news_app/viewmodel/firebase_analtyics.dart';
import 'package:coin_news_app/viewmodel/news_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../constants/text_style.dart';
import '../viewmodel/amplitude.dart';

class CoinsWidget extends StatefulWidget {
  const CoinsWidget(
      {super.key, required this.isExplore, required this.coinsList});
  final isExplore;
  final List<TopCoinModel?> coinsList;

  @override
  State<CoinsWidget> createState() => _CoinsWidgetState();
}

class _CoinsWidgetState extends State<CoinsWidget> {
  final ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(_scrollListener);
    Future.delayed(Duration.zero, () {
      Provider.of<CoinsViewModel>(context, listen: false).addItems();
    });
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isPremium = true;
    List<TopCoinModel?> coinsList = widget.coinsList;
    // var newsModel = Provider.of<NewsViewModel>(context);
    return ListView.separated(
      // physics: const NeverScrollableScrollPhysics(),
      controller: controller,
      shrinkWrap: false,
      itemBuilder: (BuildContext context, int index) {
        bool isBTC = Provider.of<CoinsViewModel>(context, listen: false)
            .isBTC(coinsList[index]!);
        num currentPrice = coinsList[index]!.currentPrice ?? 0;
        return GestureDetector(
          onTap: () {
            AmplitudeConnection.searched_coin_tapped(coinsList[index]!.name!);
            FirebaseAnalyticsService.searched_coin_tapped(
                coinsList[index]!.name!);
            if (isPremium == true) {
              if (widget.isExplore == true) {
                Provider.of<NewsViewModel>(context, listen: false)
                    .getCoinNews(coinsList[index]!.name!);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CoinsScreen(
                              coin: coinsList[index]!,
                              isBTC: isBTC,
                            )));
              }
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PurchaseScreen(
                            source: 'premium_coin',
                            coinName: coinsList[index]!.name!,
                          )));
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                coinsList[index]!.image!,
                width: 32,
                height: 32,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.error,
                  size: 32,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.38,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coinsList[index]?.symbol?.toUpperCase() ??
                          'Default value',
                      style: boldWhiteTextStyle(22),
                    ),
                    Text(
                      coinsList[index]!.name!,
                      style: const TextStyle(
                          color: Color(0xFFAFAEB3),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              widget.isExplore == false
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width * 0.03,
                    )
                  : SizedBox(
                      width: MediaQuery.of(context).size.width * 0.06,
                    ),
              Container(
                width: MediaQuery.of(context).size.width * 0.35,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      "\$ " +
                          (Provider.of<CoinsViewModel>(context, listen: false)
                              .formatCurrenValue(currentPrice)),
                      style: boldWhiteTextStyle(18),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.035,
                      width: MediaQuery.of(context).size.width * 0.24,
                      decoration: BoxDecoration(
                          color: positiveValueColor,
                          borderRadius: BorderRadius.circular(9)),
                      child: Text(
                        "+100,06%",
                        style: boldWhiteTextStyle(16),
                      ),
                    )
                  ],
                ),
              ),
              // widget.isExplore == false
              //     ? const SizedBox(width: 30)
              //     : const SizedBox(),
              widget.isExplore == false
                  ? GestureDetector(
                      onTap: () {
                        AmplitudeConnection.tracked_coin_tapped(
                            coinsList[index]!.name!);
                        FirebaseAnalyticsService.tracked_coin_tapped(
                            coinsList[index]!.name!);
                        if (isPremium == true) {
                          Provider.of<NewsViewModel>(context, listen: false)
                              .getCoinNews(coinsList[index]!.name!);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CoinsScreen(
                                        coin: coinsList[index]!,
                                        isBTC: isBTC,
                                      )));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PurchaseScreen(
                                        source: 'premium_coin',
                                        coinName: coinsList[index]!.name!,
                                      )));
                        }
                      },
                      child:
                          Image.asset("assets/buttons/tracked_coins_arrow.png"))
                  : const SizedBox()
            ],
          ),
        );
      },
      itemCount: coinsList.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 10);
      },
    );
  }

  void _scrollListener() {
    if (controller.position.extentAfter < 500) {
      Provider.of<CoinsViewModel>(context, listen: false).addItems();
    }
  }
}
