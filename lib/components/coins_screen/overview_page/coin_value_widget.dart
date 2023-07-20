import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../constants/text_style.dart';
import '../../../model/top_coin_model.dart';
import '../../../viewmodel/coins_view_model.dart';

class CoinValueWidget extends StatelessWidget {
  const CoinValueWidget({
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
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  coinList.symbol!.toUpperCase(),
                  style: TextStyle(
                      color: coinNewsColor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 5),
                Image.asset("assets/buttons/coins_screen_divider.png"),
                const SizedBox(width: 5),
                Text(
                  "USD",
                  style: TextStyle(
                      color: coinNewsColor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            Text(
              "\$ ${Provider.of<CoinsViewModel>(context, listen: false).formatCurrenValue(coinList.currentPrice ?? 0)}",
              style: boldWhiteTextStyle(28),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25),
          child: Row(
            children: [
              Wrap(
                spacing: -5,
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.end,
                children: [
                  Text(
                    "6H",
                    style: boldWhiteTextStyle(16),
                  ),
                  Text(
                    "24H",
                    style: boldWhiteTextStyle(16),
                  ),
                ],
              ),
              const SizedBox(width: 15),
              Wrap(
                spacing: -5,
                direction: Axis.vertical,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text(
                    "30.6%",
                    style: TextStyle(
                        color: negativeValueColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "3.6%",
                    style: TextStyle(
                        color: positiveValueColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}
