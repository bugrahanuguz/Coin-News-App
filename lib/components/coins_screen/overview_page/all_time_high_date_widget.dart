import 'package:flutter/material.dart';

import '../../../constants/text_style.dart';

class AllTimeHighDateWidget extends StatelessWidget {
  const AllTimeHighDateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "All-Time High Date",
          style: boldWhiteTextStyle(18),
        ),
        Text(
          "7 days ago",
          style: boldWhiteTextStyle(18),
        ),
      ],
    );
  }
}
