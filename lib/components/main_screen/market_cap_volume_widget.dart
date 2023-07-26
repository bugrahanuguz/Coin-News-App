import 'package:coin_news_app/constants/text_style.dart';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class MarketCapAndVolumeWidget extends StatelessWidget {
  const MarketCapAndVolumeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        marketCapOrVolumeWidget(
            context, "Total Market Cap", "\$1.23T", "50.55%", true),
        marketCapOrVolumeWidget(
            context, "24H Volume", "\$30.7B", "150.55%", false),
      ],
    );
  }

  Container marketCapOrVolumeWidget(BuildContext context, String headline,
      String value, String changeValue, bool isPositive) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.105,
      width: MediaQuery.of(context).size.width * 0.455,
      padding: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
          color: widgetbackground, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            headline,
            style: boldWhiteTextStyle(12),
          ),
          Row(
            children: [
              //Bu değer alınacak.
              Text(
                value,
                style: boldWhiteTextStyle(28),
              ),
              const SizedBox(width: 3),
              Row(
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: isPositive == true
                        ? ShapeDecoration(
                            shape: StarBorder.polygon(sides: 3),
                            color: positiveValueColor)
                        : ShapeDecoration(
                            shape: StarBorder.polygon(sides: 3, rotation: 180),
                            color: negativeValueColor),
                  ),
                  Text(
                    changeValue,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        color: isPositive == true
                            ? positiveValueColor
                            : negativeValueColor),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
