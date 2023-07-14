import 'package:flutter/material.dart';

import '../../constants/text_style.dart';

class PurchaseScreenTextWidget extends StatelessWidget {
  const PurchaseScreenTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.44,
      left: 10,
      right: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Coin News',
            style: boldWhiteTextStyle(46),
          ),
          const Text(
            'Unlimited+',
            style: TextStyle(
                color: Color(0xff00C555),
                fontSize: 41.4,
                fontWeight: FontWeight.w600),
          ),
          Text(
            'Unlock all coins',
            style: boldWhiteTextStyle(30),
          ),
          Text(
            'Access 1200+ coins, handpicked news and tweets. No bullshit, just Coin News.',
            style: boldWhiteTextStyle(24),
          ),
        ],
      ),
    );
  }
}
