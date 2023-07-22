import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/text_style.dart';
import '../../viewmodel/firebase_remote_config.dart';

class PurchaseScreenTextWidget extends StatelessWidget {
  const PurchaseScreenTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String coinUnlimited = Provider.of<RemoteConfigService>(context)
        .getString('onb_headline_purchase');
    List<String> messageParts = coinUnlimited.split(" ");
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.46,
      left: 10,
      right: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              text: TextSpan(
            text: "${messageParts[0]} ${messageParts[1]} ", // "Coin News "
            style: boldWhiteTextStyle(52),
            children: <TextSpan>[
              TextSpan(
                  text: messageParts[2],
                  style: const TextStyle(
                      color: Color(0xff00C555),
                      fontSize: 47.4,
                      fontWeight: FontWeight.w600)), // "Unlimited+" in red
            ],
          )),
          // Text(
          //   coinUnlimited,
          //   style: boldWhiteTextStyle(46),
          // ),
          // const Text(
          //   'Unlimited+',
          //   style: TextStyle(
          //       color: Color(0xff00C555),
          //       fontSize: 41.4,
          //       fontWeight: FontWeight.w600),
          // ),
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
