import 'package:flutter/material.dart';

import '../../../constants/text_style.dart';

class WhitePaperWidget extends StatelessWidget {
  const WhitePaperWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
    "White Paper",
    style: boldWhiteTextStyle(18),
        ),
        Image.asset("assets/buttons/white_paper.png")
      ],
    );
  }
}