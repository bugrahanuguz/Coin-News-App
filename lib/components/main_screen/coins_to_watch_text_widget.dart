import 'package:flutter/cupertino.dart';

import '../../constants/text_style.dart';

class CoinstoWathTextWidget extends StatelessWidget {
  const CoinstoWathTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Coins to watch this week",
        style: boldWhiteTextStyle(18),
      ),
    );
  }
}