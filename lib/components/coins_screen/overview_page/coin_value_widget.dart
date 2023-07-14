import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/text_style.dart';

class CoinValueWidget extends StatelessWidget {
  const CoinValueWidget({
    super.key,
  });

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
                  "BTC",
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
              "\$ 62,081.12",
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
