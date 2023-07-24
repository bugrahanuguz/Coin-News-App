import 'package:coin_news_app/viewmodel/amplitude.dart';
import 'package:flutter/material.dart';

import '../../../constants/text_style.dart';
import '../../../model/top_coin_model.dart';
import '../../../viewmodel/firebase_analtyics.dart';

class WhitePaperWidget extends StatelessWidget {
  const WhitePaperWidget({
    super.key,
    required this.coinList,
  });
  final TopCoinModel coinList;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AmplitudeConnection.white_paper_link_tapped(coinList.name!);
        FirebaseAnalyticsService.white_paper_link_tapped(coinList.name!);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "White Paper",
            style: boldWhiteTextStyle(18),
          ),
          Image.asset("assets/buttons/white_paper.png")
        ],
      ),
    );
  }
}
