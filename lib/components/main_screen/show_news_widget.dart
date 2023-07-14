import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/text_style.dart';

class ShowNewsWidget extends StatelessWidget {
  const ShowNewsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.158,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: widgetbackground, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          const Icon(
            Icons.access_alarm,
            size: 84,
            color: Colors.white,
          ),
          const SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 25),
              Text(
                "The Bitcoin ETF Race Is Over and Also \nJust Beginning",
                style: boldWhiteTextStyle(14),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.025),
              const Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  "18 days ago",
                  style: TextStyle(
                      color: Color(0xFF7A7A7A),
                      fontSize: 11,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}