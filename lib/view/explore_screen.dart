import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/coins_widget.dart';
import '../components/explore_screen/explore_screen_app_bar.dart';
import '../components/explore_screen/search_bar.dart';
import '../model/top_coin_model.dart';
import '../viewmodel/coins_view_model.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<TopCoinModel?> coinsList = context.watch<CoinsViewModel>().coinsItems;
    List<TopCoinModel?> filteredCoinsList = context.watch<CoinsViewModel>().filteredCoinsList;
    return  Scaffold(
      appBar: const ExploreScreenAppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            const ExploreScreenSearchBar(),
            const SizedBox(height: 10),
            Expanded(
              child: CoinsWidget(
                isExplore: true,
                coinsList: filteredCoinsList,
              ),
            )
          ],
        ),
      ),
    );
  }
}
