import 'package:coin_news_app/model/top_coin_model.dart';
import 'package:coin_news_app/viewmodel/coins_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/coins_screen/coins_app_bar.dart';
import '../components/coins_screen/news_page/news_page.dart';
import '../components/coins_screen/overview_page/overview_page.dart';

class CoinsScreen extends StatelessWidget {
  final TopCoinModel coin;
  final bool isBTC;
  const CoinsScreen({
    super.key,
    required this.coin,
    required this.isBTC,
  });

  @override
  Widget build(BuildContext context) {
    List list = [1];
    List tweetList = [1];
    bool isAdd = Provider.of<CoinsViewModel>(context).isAdded(coin);
    return DefaultTabController(
      length: list.isNotEmpty ? 2 : 1,
      child: Scaffold(
        appBar: CoinsScreenAppBar(
          list: list,
          isAdd: isAdd,
          isBTC: isBTC,
          coin: coin,
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            OverviewPage(
              isAdd: isAdd,
              getCoin: coin,
              isBTC: isBTC,
            ),
            if (list.isNotEmpty) ...[
              NewsPage(tweetList: tweetList),
            ]
          ],
        ),
      ),
    );
  }
}
