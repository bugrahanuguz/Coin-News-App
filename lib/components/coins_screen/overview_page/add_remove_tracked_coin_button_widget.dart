import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/text_style.dart';

class AddOrRemoveTrackedCoinsButtonWidget extends StatelessWidget {
  const AddOrRemoveTrackedCoinsButtonWidget({
    super.key,required this.isAdd,
  });
  final isAdd;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 51,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: widgetbackground, borderRadius: BorderRadius.circular(9)),
        child: isAdd==false ? Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/buttons/plus_circle.png"),
            const SizedBox(width: 10),
            Text(
              "Add to Tracked Coin",
              style: boldWhiteTextStyle(19),
            )
          ],
        ): Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/buttons/minus_circle.png"),
            const SizedBox(width: 10),
            Text(
              "Remove to Tracked Coin",
              style: boldWhiteTextStyle(19),
            )
          ],
        )
      ),
    );
  }
}