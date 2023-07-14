import 'package:coin_news_app/constants/text_style.dart';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../view/coins_screen.dart';

class CoinstoWatchWidget extends StatelessWidget {
  const CoinstoWatchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      //height = 80
      height: MediaQuery.of(context).size.height * 0.105,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (BuildContext context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CoinsScreen())),
            child: Container(
              //width = 91
              width: MediaQuery.of(context).size.width * 0.227,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: widgetbackground,
                  borderRadius: BorderRadius.circular(9.7)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.access_alarm,
                    size: 32,
                    color: Colors.white,
                  ),
                  Text(
                    "FTX Token",
                    style: boldWhiteTextStyle(14),
                  ),
                  Text(
                    "\$ 63,66",
                    style: TextStyle(
                        color: negativeValueColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, index) {
          return const SizedBox(width: 5);
        },
      ),
    );
  }
}
