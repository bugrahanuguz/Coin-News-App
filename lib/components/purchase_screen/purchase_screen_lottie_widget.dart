
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PurchaseScreenLottieWidget extends StatelessWidget {
  const PurchaseScreenLottieWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -150,
      top: -120,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        constraints: BoxConstraints.expand(
          height: MediaQuery.of(context).size.height * 1.1,
          width: MediaQuery.of(context).size.width * 1.93,
        ),
        child: Lottie.asset(
          'assets/purchase_screen_lottie.json',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
