
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/text_style.dart';

class AllTimeHighWidget extends StatelessWidget {
  const AllTimeHighWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "All-Time High",
          style: boldWhiteTextStyle(18),
        ),
        Text(
          "\$66,890.89",
          style: TextStyle(
              color: positiveValueColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}