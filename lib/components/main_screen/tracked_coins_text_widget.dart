import 'package:coin_news_app/constants/text_style.dart';
import 'package:flutter/material.dart';

class TrackedCoinsTextWidget extends StatelessWidget {
  const TrackedCoinsTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Tracked Coins",
          style: boldWhiteTextStyle(18),
        ));
  }
}
