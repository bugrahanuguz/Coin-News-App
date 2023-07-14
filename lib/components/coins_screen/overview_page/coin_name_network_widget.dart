import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/text_style.dart';

class CoinNameAndNetworkWidget extends StatelessWidget {
  const CoinNameAndNetworkWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Wrap(
          direction: Axis.vertical,
          spacing: -8,
          children: [
            Text(
              "Bitcoin",
              style: boldWhiteTextStyle(15),
            ),
            Text(
              "BTC",
              style: boldWhiteTextStyle(28),
            ),
          ],
        ),
        const SizedBox(width: 10),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.078,
            height: MediaQuery.of(context).size.height * 0.033,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: widgetbackground,
                borderRadius: BorderRadius.circular(7)),
            child: Text(
              "#1",
              style: TextStyle(
                  color: coinNewsColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.115,
            height: MediaQuery.of(context).size.height * 0.033,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: widgetbackground,
                borderRadius: BorderRadius.circular(7)),
            child: Text(
              "coin",
              style: TextStyle(
                  color: coinNewsColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.425),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: GestureDetector(
              child: Image.asset("assets/buttons/reddit_icon.png")),
        ),
        const SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child:
              GestureDetector(child: Image.asset("assets/buttons/network.png")),
        )
      ],
    );
  }
}