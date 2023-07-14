import 'package:coin_news_app/view/coins_screen.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../constants/text_style.dart';

class CoinsWidget extends StatelessWidget {
  const CoinsWidget({super.key, required this.isExplore});
  final isExplore;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              if (isExplore == true) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CoinsScreen()));
              }
            },
            child: Row(
              children: [
                const Icon(
                  Icons.access_alarm,
                  size: 35,
                  color: Colors.white,
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "BTC",
                      style: boldWhiteTextStyle(22),
                    ),
                    const Text(
                      "Bitcoin",
                      style: TextStyle(
                          color: Color(0xFFAFAEB3),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                isExplore == false
                    ? SizedBox(
                        width: MediaQuery.of(context).size.width * 0.32,
                      )
                    : SizedBox(
                        width: MediaQuery.of(context).size.width * 0.42,
                      ),
                Column(
                  children: [
                    Text(
                      "\$ 62,081.12",
                      style: boldWhiteTextStyle(18),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.035,
                      width: MediaQuery.of(context).size.width * 0.24,
                      decoration: BoxDecoration(
                          color: positiveValueColor,
                          borderRadius: BorderRadius.circular(9)),
                      child: Text(
                        "+100,06%",
                        style: boldWhiteTextStyle(16),
                      ),
                    )
                  ],
                ),
                isExplore == false
                    ? const SizedBox(width: 30)
                    : const SizedBox(),
                isExplore == false
                    ? GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CoinsScreen())),
                        child: Image.asset("assets/buttons/tracked_coins_arrow.png"))
                    : const SizedBox()
              ],
            ),
          );
        },
        itemCount: 30,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 10);
        },
      ),
    );
  }
}
