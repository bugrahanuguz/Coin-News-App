import 'package:flutter/material.dart';

import '../../constants/text_style.dart';

class MostImportantDevelopmentsTextWidget extends StatelessWidget {
  const MostImportantDevelopmentsTextWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        "Most important developments of the day",
        style: boldWhiteTextStyle(18),
      ),
    );
  }
}