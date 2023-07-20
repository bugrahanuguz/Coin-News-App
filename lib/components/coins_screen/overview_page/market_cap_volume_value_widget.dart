import 'package:coin_news_app/viewmodel/coins_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/text_style.dart';
import '../../../model/top_coin_model.dart';

class MarketCapAndVolumeValueWidget extends StatelessWidget {
  const MarketCapAndVolumeValueWidget({
    super.key,
    required this.coinList,
  });
  final TopCoinModel coinList;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Wrap(
          spacing: -5,
          direction: Axis.vertical,
          children: [
            Text(
              "Market Cap",
              style: boldWhiteTextStyle(22),
            ),
            Text(
              "\$" +
                  Provider.of<CoinsViewModel>(context)
                      .formatNumber(coinList.marketCap ?? 0),
              style: boldWhiteTextStyle(22),
            )
          ],
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: -5,
          direction: Axis.vertical,
          children: [
            Text(
              "Volume 24H",
              style: boldWhiteTextStyle(22),
            ),
            Text(
              "\$" +
                  Provider.of<CoinsViewModel>(context)
                      .formatNumber(coinList.totalVolume ?? 0),
              style: boldWhiteTextStyle(22),
            ),
          ],
        )
      ],
    );
  }
}
