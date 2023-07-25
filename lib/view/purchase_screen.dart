import 'package:coin_news_app/constants/colors.dart';
import 'package:coin_news_app/view/bottom_nav_bar.dart';
import 'package:coin_news_app/viewmodel/amplitude.dart';
import 'package:coin_news_app/viewmodel/firebase_analtyics.dart';
import 'package:flutter/material.dart';
import '../components/purchase_screen/purchase_screen_button_widget.dart';
import '../components/purchase_screen/purchase_screen_lottie_widget.dart';
import '../components/purchase_screen/purchase_screen_text_widget.dart';

class PurchaseScreen extends StatelessWidget {
  final String source;
  final String? coinName;
  const PurchaseScreen({
    super.key,
    required this.source,
    this.coinName,
  });

  @override
  Widget build(BuildContext context) {
    AmplitudeConnection.purchase_screen_viewed();
    FirebaseAnalyticsService.purchase_screen_viewed();
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
            PurchaseScreenButtonsWidget(
              source: source,
              coinName: coinName ?? "",
            )
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
          FirebaseAnalyticsService.purchased_screen_closed();
          AmplitudeConnection.purchased_screen_closed();
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const BottomNavBar()),
              ((Route<dynamic> route) => false));
          // AmplitudeConnection.purchase_canceled();
        },
        child: Image.asset("assets/buttons/close_button.png")),
  );
}
