import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/text_style.dart';

class SinceAllTimeHighWidget extends StatelessWidget {
  const SinceAllTimeHighWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Since All-Time High",
          style: boldWhiteTextStyle(18),
        ),
        Text(
          "-8.44%",
          style: TextStyle(
              color: negativeValueColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}