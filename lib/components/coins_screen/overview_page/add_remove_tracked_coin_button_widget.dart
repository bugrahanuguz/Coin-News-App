import 'package:coin_news_app/model/top_coin_model.dart';
import 'package:coin_news_app/viewmodel/amplitude.dart';
import 'package:coin_news_app/viewmodel/coins_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../constants/text_style.dart';
import '../../../viewmodel/firebase_analtyics.dart';

class AddOrRemoveTrackedCoinsButtonWidget extends StatelessWidget {
  const AddOrRemoveTrackedCoinsButtonWidget({
    super.key,
    required this.isAdd,
    required this.isBTC,
    required this.coin,
  });
  final isAdd;
  final bool isBTC;
  final TopCoinModel coin;

  @override
  Widget build(BuildContext context) {
    return isBTC == false
        ? GestureDetector(
            onTap: () {
              if (isAdd == false) {
                AmplitudeConnection.coin_tracked(coin.name!);
                FirebaseAnalyticsService.coin_tracked(coin.name!);
                Provider.of<CoinsViewModel>(context, listen: false)
                    .addTrackedCoin(coin);
                Provider.of<CoinsViewModel>(context, listen: false)
                    .isAdded(coin);
                Provider.of<CoinsViewModel>(context, listen: false)
                    .saveTrackedCoins();
              } else {
                AmplitudeConnection.coin_untracked(coin.name!);
                FirebaseAnalyticsService.coin_untracked(coin.name!);
                Provider.of<CoinsViewModel>(context, listen: false)
                    .removeTrackedCoin(coin);
                Provider.of<CoinsViewModel>(context, listen: false)
                    .isAdded(coin);
                    Provider.of<CoinsViewModel>(context, listen: false)
                    .saveTrackedCoins();
              }
            },
            child: Container(
                height: 51,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: widgetbackground,
                    borderRadius: BorderRadius.circular(9)),
                child: isAdd == false
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/buttons/plus_circle.png"),
                          const SizedBox(width: 10),
                          Text(
                            "Add to Tracked Coin",
                            style: boldWhiteTextStyle(19),
                          )
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/buttons/minus_circle.png"),
                          const SizedBox(width: 10),
                          Text(
                            "Remove to Tracked Coin",
                            style: boldWhiteTextStyle(19),
                          )
                        ],
                      )),
          )
        : const SizedBox();
  }
}
