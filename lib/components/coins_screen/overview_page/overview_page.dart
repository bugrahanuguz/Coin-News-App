import 'package:coin_news_app/components/coins_screen/overview_page/since_all_time_high_widget.dart';
import 'package:coin_news_app/components/coins_screen/overview_page/wallet_source_widget.dart';
import 'package:coin_news_app/components/coins_screen/overview_page/white_paper_widget.dart';
import 'package:flutter/material.dart';
import 'add_remove_tracked_coin_button_widget.dart';
import 'all_time_high_date_widget.dart';
import 'all_time_high_widget.dart';
import 'coin_name_network_widget.dart';
import 'coin_value_widget.dart';
import 'description_widget.dart';
import 'market_cap_volume_value_widget.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key, required this.isAdd});
  final isAdd;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        children: [
          const CoinNameAndNetworkWidget(),
          _sizedBox(),
          const CoinValueWidget(),
          _sizedBox(),
          const MarketCapAndVolumeValueWidget(),
          _sizedBox(),
          const AllTimeHighWidget(),
          _sizedBox(),
          const SinceAllTimeHighWidget(),
          _sizedBox(),
          const AllTimeHighDateWidget(),
          _sizedBox(),
          const WalletAndSourceWidget(),
          _sizedBox(),
          const WhitePaperWidget(),
          _sizedBox(),
          buildDivider(),
          const SizedBox(height: 10),
          const DescriptionWidget(),
          const SizedBox(height: 10),
          AddOrRemoveTrackedCoinsButtonWidget(
            isAdd: isAdd,
          )
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

  SizedBox _sizedBox() => const SizedBox(height: 18);
}
