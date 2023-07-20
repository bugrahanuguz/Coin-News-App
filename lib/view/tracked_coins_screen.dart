import 'package:coin_news_app/components/coins_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/tracked_coins_screen/tracked_coin_app_bar.dart';
import '../model/top_coin_model.dart';
import '../viewmodel/coins_view_model.dart';

class TrackedCoinsScreen extends StatelessWidget {
  const TrackedCoinsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<TopCoinModel?> coinsList = context.watch<CoinsViewModel>().trackedCoins;
    return  Scaffold(
      appBar: const TrackedCoinsAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: CoinsWidget(
      isExplore: false,
      coinsList: coinsList,
        ),
      ),
    );
  }
}
