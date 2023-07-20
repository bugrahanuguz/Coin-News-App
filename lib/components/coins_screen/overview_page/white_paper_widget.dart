import 'package:flutter/material.dart';

import '../../../constants/text_style.dart';
import '../../../model/top_coin_model.dart';

class WhitePaperWidget extends StatelessWidget {
  const WhitePaperWidget({
    super.key, required this.coinList, 
  });
final TopCoinModel coinList;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
    "White Paper",
    style: boldWhiteTextStyle(18),
        ),
        Image.asset("assets/buttons/white_paper.png")
      ],
    );
  }
}