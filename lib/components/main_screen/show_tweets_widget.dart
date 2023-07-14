import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/text_style.dart';

class ShowTweetsWidget extends StatelessWidget {
  const ShowTweetsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.92,
      height: MediaQuery.of(context).size.height * 0.264,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: widgetbackground, borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.person,
                size: 40,
                color: Colors.white,
              ),
              Column(
                children: [
                  Text(
                    "jack",
                    style: tweetTextStyle(15),
                  ),
                  Text(
                    "@jack",
                    style: tweetTextStyle(14),
                  ),
                ],
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.55),
              Image.asset("assets/twitter_logo.png")
            ],
          ),
          const SizedBox(height: 10),
          Text(
            "#eth",
            style: tweetTextStyle(15),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          const Align(
            alignment: Alignment.bottomRight,
            child: Text(
              "18 days ago",
              style: TextStyle(
                  color: Color(0xFF7A7A7A),
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
