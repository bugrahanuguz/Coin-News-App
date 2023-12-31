import 'package:coin_news_app/viewmodel/amplitude.dart';
import 'package:coin_news_app/viewmodel/firebase_analtyics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../model/top_coin_model.dart';
import '../../viewmodel/coins_view_model.dart';

class CoinsScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CoinsScreenAppBar({
    super.key,
    required this.list,
    required this.isAdd,
    required this.isBTC,
    required this.coin,
  });

  final List list;
  final bool isAdd;
  final bool isBTC;
  final TopCoinModel coin;

  @override
  Widget build(BuildContext context) {
    bool isNotifOn =
        Provider.of<CoinsViewModel>(context).isNotificationActive(coin.name!);
    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset("assets/buttons/back_button.png")),
      actions: [
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            isBTC == false
                ? isNotifOn == true
                    ? GestureDetector(
                        onTap: () {
                          AmplitudeConnection.notification_disabled(coin.name!);
                          FirebaseAnalyticsService.notification_disabled(
                              coin.name!);
                          Provider.of<CoinsViewModel>(context, listen: false)
                              .isAdded(coin);
                          Provider.of<CoinsViewModel>(context, listen: false)
                              .toggleNotification(coin.name!);

                          Provider.of<CoinsViewModel>(context, listen: false)
                              .saveTrackedCoins();
                        },
                        child: Image.asset(
                          "assets/buttons/bell_fill.png",
                        ))
                    : GestureDetector(
                        onTap: () {
                          AmplitudeConnection.notification_enabled(coin.name!);
                          FirebaseAnalyticsService.notification_enabled(
                              coin.name!);
                          Provider.of<CoinsViewModel>(context, listen: false)
                              .addTrackedCoin(coin);
                          Provider.of<CoinsViewModel>(context, listen: false)
                              .toggleNotification(coin.name!);
                          Provider.of<CoinsViewModel>(context, listen: false)
                              .isAdded(coin);
                          Provider.of<CoinsViewModel>(context, listen: false)
                              .saveTrackedCoins();
                        },
                        child: Image.asset(
                          "assets/buttons/bell.png",
                        ))
                : SizedBox(
                    width: 32,
                  ),
          ],
        )
      ],
      title: Center(
        child: Container(
          width: list.isNotEmpty
              ? MediaQuery.of(context).size.width * 0.8
              : MediaQuery.of(context).size.width * 0.33,
          height: MediaQuery.of(context).size.height * 0.046,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(9)),
          child: TabBar(
            overlayColor: MaterialStatePropertyAll(Colors.transparent),
            splashFactory: NoSplash.splashFactory,
            indicator: BoxDecoration(
                color: widgetbackground,
                borderRadius: BorderRadius.circular(9)),
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            labelColor: coinNewsColor,
            unselectedLabelColor: Colors.white,
            onTap: (value) {
              if (value == 0) {
                AmplitudeConnection.coin_screen_overview_tapped();
                FirebaseAnalyticsService.coin_screen_overview_tapped();
              } else {
                AmplitudeConnection.coin_screen_news_view_tapped();
                FirebaseAnalyticsService.coin_screen_news_view_tapped();
              }
            },
            tabs: [
              const Tab(
                child: Text(
                  "Overview",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              if (list.isNotEmpty) ...[
                const Tab(
                  child: Text(
                    "News",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
