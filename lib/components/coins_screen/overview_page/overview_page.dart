import 'package:coin_news_app/components/coins_screen/overview_page/since_all_time_high_widget.dart';
import 'package:coin_news_app/components/coins_screen/overview_page/wallet_source_widget.dart';
import 'package:coin_news_app/components/coins_screen/overview_page/white_paper_widget.dart';
import 'package:coin_news_app/model/top_coin_model.dart';
import 'package:flutter/material.dart';
import 'add_remove_tracked_coin_button_widget.dart';
import 'all_time_high_date_widget.dart';
import 'all_time_high_widget.dart';
import 'coin_name_network_widget.dart';
import 'coin_value_widget.dart';
import 'description_widget.dart';
import 'market_cap_volume_value_widget.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage(
      {super.key,
      required this.isAdd,
      required this.getCoin,
      required this.isBTC});
  final isAdd;
  final bool isBTC;
  final TopCoinModel getCoin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CoinNameAndNetworkWidget(
            coinList: getCoin,
          ),
          _sizedBox(),
          CoinValueWidget(coinList: getCoin),
          _sizedBox(),
          MarketCapAndVolumeValueWidget(coinList: getCoin),
          _sizedBox(),
          AllTimeHighWidget(coinList: getCoin),
          _sizedBox(),
          SinceAllTimeHighWidget(coinList: getCoin),
          _sizedBox(),
          AllTimeHighDateWidget(coinList: getCoin),
          _sizedBox(),
          WalletAndSourceWidget(coinList: getCoin),
          _sizedBox(),
          WhitePaperWidget(coinList: getCoin),
          _sizedBox(),
          buildDivider(),
          const SizedBox(height: 10),
          DescriptionWidget(coinList: getCoin),
          const SizedBox(height: 10),
          AddOrRemoveTrackedCoinsButtonWidget(
              isAdd: isAdd, isBTC: isBTC, coin: getCoin)
        ],
      ),
    );
  }

  Divider buildDivider() {
    return const Divider(
      height: 5,
      thickness: 1,
      color: Colors.white,
      indent: 0,
      endIndent: 0,
    );
  }

  SizedBox _sizedBox() => const SizedBox(height: 0);
}
