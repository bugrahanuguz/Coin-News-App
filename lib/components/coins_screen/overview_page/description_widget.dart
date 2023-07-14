import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/text_style.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: -3,
      crossAxisAlignment: WrapCrossAlignment.start,
      children: [
        Text(
          "Description",
          style: TextStyle(
              color: coinNewsColor, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Text(
          "Bitcoin is a cryptocurrency and worldwide payment system. It is the first decentralized digital currency, as the system works without a central bank...",
          style: boldWhiteTextStyle(18),
        )
      ],
    );
  }
}