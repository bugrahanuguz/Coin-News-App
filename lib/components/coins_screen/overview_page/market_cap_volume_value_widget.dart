import 'package:flutter/material.dart';

import '../../../constants/text_style.dart';

class MarketCapAndVolumeValueWidget extends StatelessWidget {
  const MarketCapAndVolumeValueWidget({
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
          children: [
            Text(
              "Market Cap",
              style: boldWhiteTextStyle(22),
            ),
            Text(
              "\$1.1 Tr",
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
              "\$47.5 Bn",
              style: boldWhiteTextStyle(22),
            ),
          ],
        )
      ],
    );
  }
}