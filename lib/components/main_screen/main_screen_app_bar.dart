import 'package:coin_news_app/view/purchase_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../constants/colors.dart';

class MainScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      title: Text(
        "Coin News",
        style: TextStyle(
            fontSize: 30, fontWeight: FontWeight.w700, color: coinNewsColor),
      ),
      actions: [premiumButton(context)],
    );
  }

  GestureDetector premiumButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => PurchaseScreen()));
      },
      child: Lottie.asset(
        'assets/premium_button.json',
        width: MediaQuery.of(context).size.width * 0.125,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}