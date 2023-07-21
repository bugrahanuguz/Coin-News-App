import 'package:coin_news_app/constants/text_style.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class FeerAndGreedIndexWidget extends StatelessWidget {
  const FeerAndGreedIndexWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int feerGreedIndexValue = 75;
    return Container(
      height: MediaQuery.of(context).size.height * 0.105,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: widgetbackground),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          feerGreedIndexText(),
          indexProgressBar(context, feerGreedIndexValue),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              feerGreedText("Fear"),
              feerGreedText("$feerGreedIndexValue/100"),
              feerGreedText("Greed"),
            ],
          )
        ],
      ),
    );
  }

  SizedBox indexProgressBar(BuildContext context, int feerGreedIndexValue) {
    return SizedBox(
      height: 30,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: const LinearGradient(
                colors: [
                  Colors.red,
                  Colors.yellow,
                  Colors.green,
                ],
              ),
            ),
          ),
          Positioned(
            left: feerGreedIndexValue *
                (MediaQuery.of(context).size.width - 47) /
                100,
            child: Container(
              width: 6,
              height: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Text feerGreedIndexText() {
    return Text(
      "Fear & Greed Index",
      style: boldWhiteTextStyle(12),
    );
  }
}

Text feerGreedText(String text) {
  return Text(
    text,
    style: boldWhiteTextStyle(10),
  );
}
