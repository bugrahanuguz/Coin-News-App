import 'package:flutter/material.dart';

import '../../../constants/text_style.dart';
import '../../../model/top_coin_model.dart';

class AllTimeHighDateWidget extends StatelessWidget {
  const AllTimeHighDateWidget({
       super.key, required this.coinList, 
  });
final TopCoinModel coinList;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "All-Time High Date",
          style: boldWhiteTextStyle(18),
        ),
        Text(
          "7 days ago",
          style: boldWhiteTextStyle(18),
        ),
      ],
    );
  }
}
