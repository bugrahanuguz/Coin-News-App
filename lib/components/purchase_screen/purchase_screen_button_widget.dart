import 'package:coin_news_app/viewmodel/change_screens.dart';
import 'package:coin_news_app/viewmodel/qonversion.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qonversion_flutter/qonversion_flutter.dart';

import '../../constants/text_style.dart';

class PurchaseScreenButtonsWidget extends StatelessWidget {
  final String productID = 'cn_4999_1y_3d0';
  const PurchaseScreenButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Future<QProduct>? products = Provider.of<QonversionService>(context, listen: false)
    //                     .getProductById(productId);
    // Provider.of<QonversionService>(context, listen: false).loadOfferings();
    var qonversionService = Provider.of<QonversionService>(context);
    return Positioned(
        top: MediaQuery.of(context).size.height * 0.84,
        left: 10,
        right: 10,
        child: Column(
          children: [
            GestureDetector(
              onTap: () async {
                print("butona basıldı");
                try {
                  QProduct? product =
                      await qonversionService.getProductById(productID);
                  qonversionService.purchaseProduct(product!);
                  print(product);
                } catch (e) {
                  print('Error making purchase: $e');
                }
              },
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: 51,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: const Color(0xff00C555),
                      borderRadius: BorderRadius.circular(9)),
                  child: Text(
                    "Continue",
                    style: boldWhiteTextStyle(19),
                  )),
            ),
            // FutureBuilder<QProduct?>(
            //   future: Provider.of<QonversionService>(context, listen: false).getProductById(productID),
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.waiting) {
            //       // You can return a loading spinner here
            //       return CircularProgressIndicator();
            //     } else if (snapshot.hasError) {
            //       // Handle the error here
            //       return Text("Error: ${snapshot.error}");
            //     } else {
            //       // We have the data, we can use it in our widget
            //       QProduct product = snapshot.data!;
            //       return GestureDetector(
            //         onTap: () async {
            //           print("butona basıldı");
            //           await Provider.of<QonversionService>(context, listen: false)
            //               .purchaseProduct(product);
            //         },
            //         child: Container(
            //             width: MediaQuery.of(context).size.width * 0.95,
            //             height: 51,
            //             alignment: Alignment.center,
            //             decoration: BoxDecoration(
            //                 color: const Color(0xff00C555),
            //                 borderRadius: BorderRadius.circular(9)),
            //             child: Text(
            //               "Continue",
            //               style: boldWhiteTextStyle(19),
            //             )),
            //       );
            //     }
            //   },
            // ),
            const SizedBox(height: 5),
            const Text(
              'Try it free for 3 days, then yearly \$49.99',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    context.read<ChangeScreens>().launchInBrowser(
                        Uri.parse("https://coinnewsapp.com/terms.html"));
                  },
                  child: const Text(
                    "Terms & Services",
                    style: TextStyle(
                        color: Color(0xff838483),
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Restore Purchases",
                    style: TextStyle(
                        color: Color(0xff838483),
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context.read<ChangeScreens>().launchInBrowser(
                        Uri.parse("https://coinnewsapp.com/privacy.html"));
                  },
                  child: const Text(
                    "Privacy Policy",
                    style: TextStyle(
                        color: Color(0xff838483),
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
