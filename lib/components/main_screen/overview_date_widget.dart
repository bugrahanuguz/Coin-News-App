import 'package:coin_news_app/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OverviewAndDateWidget extends StatelessWidget {
  const OverviewAndDateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentTime = DateTime.now();
    final formatDate = DateFormat('d MMMM yyyy').format(currentTime);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Market Overview",
          style: boldWhiteTextStyle(18),
        ),
        Text(
          formatDate,
          style: boldWhiteTextStyle(12),
        ),
      ],
    );
  }
}
