import 'package:coin_news_app/components/coins_widget.dart';
import 'package:flutter/material.dart';
import '../components/tracked_coins_screen/tracked_coin_app_bar.dart';

class TrackedCoinsScreen extends StatelessWidget {
  const TrackedCoinsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TrackedCoinsAppBar(),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: CoinsWidget(
          isExplore: false,
        ),
      )),
    );
  }
}
