import 'package:flutter/material.dart';

import '../../../constants/text_style.dart';

class WalletAndSourceWidget extends StatelessWidget {
  const WalletAndSourceWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Wrap(
          spacing: 8,
          children: [
            Text(
              "Hardware Wallet",
              style: boldWhiteTextStyle(18),
            ),
            Image.asset("assets/buttons/checkmark.png")
          ],
        ),
        Wrap(
          spacing: 8,
          children: [
            Text(
              "Open Source",
              style: boldWhiteTextStyle(18),
            ),
            Image.asset("assets/buttons/checkmark.png")
          ],
        ),
      ],
    );
  }
}
