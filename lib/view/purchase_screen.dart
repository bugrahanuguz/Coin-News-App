import 'package:coin_news_app/constants/colors.dart';

import 'package:flutter/material.dart';

import '../components/purchase_screen/purchase_screen_button_widget.dart';
import '../components/purchase_screen/purchase_screen_lottie_widget.dart';
import '../components/purchase_screen/purchase_screen_text_widget.dart';

class PurchaseScreen extends StatelessWidget {
  const PurchaseScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Provider.of<QonversionService>(context).getProducts();
    // var products = context.read<QonversionService>().products;
    // var handlePurchase =
    //           () => context.read<QonversionService>().purchaseProduct(products[0]);
        // Provider.of<QonversionService>(context, listen: false).loadOfferings();

    return Scaffold(
        backgroundColor: widgetbackground,
        body: Stack(
          children: [
            const PurchaseScreenLottieWidget(),
            closeButtonWidget(context),
            const PurchaseScreenTextWidget(),
            PurchaseScreenButtonsWidget()
          ],
        ));
  }
}

Positioned closeButtonWidget(BuildContext context) {
  return Positioned(
    top: 40,
    left: 20,
    child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Image.asset("assets/buttons/close_button.png")),
  );
}
