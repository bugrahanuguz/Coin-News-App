import 'package:flutter/material.dart';

import '../../constants/text_style.dart';

class PurchaseScreenButtonsWidget extends StatelessWidget {
  const PurchaseScreenButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: MediaQuery.of(context).size.height * 0.84,
        left: 10,
        right: 10,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {},
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
                  child: const Text(
                    "Terms & Services",
                    style: TextStyle(
                        color: Color(0xff838483),
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                GestureDetector(
                  child: const Text(
                    "Restore Purchases",
                    style: TextStyle(
                        color: Color(0xff838483),
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                GestureDetector(
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
