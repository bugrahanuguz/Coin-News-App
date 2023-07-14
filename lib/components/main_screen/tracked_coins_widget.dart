import 'package:coin_news_app/view/coins_screen.dart';
import 'package:coin_news_app/viewmodel/change_screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../constants/text_style.dart';

class TrackedCoinsWidget extends StatelessWidget {
  const TrackedCoinsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      //height = 120
      height: MediaQuery.of(context).size.height * 0.158,
      child: ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: [
            trackCoin(),
            const SizedBox(width: 15),
            trackMoreCoinsWidget(context)
          ]),
    );
  }

  ListView trackCoin() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 1,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            //Coins Screene Git.
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CoinsScreen()));
          },
          child: Container(
            //width = 120
            width: MediaQuery.of(context).size.width * 0.356,
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: widgetbackground),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.add_circle_outline,
                  size: 38,
                  color: coinNewsColor,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bitcoin",
                      style: boldWhiteTextStyle(18),
                    ),
                    Text(
                      "\$ 62,081.12",
                      style: TextStyle(
                          color: positiveValueColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(width: 15);
      },
    );
  }

  GestureDetector trackMoreCoinsWidget(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ChangeScreens>().changeScreen(1);
      },
      child: Container(
        width: 140,
        height: 120,
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: widgetbackground),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.add_circle_outline,
              size: 38,
              color: coinNewsColor,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Track",
                  style: boldWhiteTextStyle(18),
                ),
                Text(
                  "More Coins",
                  style: boldWhiteTextStyle(18),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
