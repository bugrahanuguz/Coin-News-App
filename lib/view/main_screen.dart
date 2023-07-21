import 'package:coin_news_app/constants/colors.dart';
import 'package:flutter/material.dart';
import '../components/main_screen/coins_to_watch_text_widget.dart';
import '../components/main_screen/coins_to_watch_widget.dart';
import '../components/main_screen/fear_greed_index_widget.dart';
import '../components/main_screen/main_screen_app_bar.dart';
import '../components/main_screen/market_cap_volume_widget.dart';
import '../components/main_screen/most_important_developments_text_widget.dart';
import '../components/main_screen/most_important_developments_widget.dart';
import '../components/main_screen/overview_date_widget.dart';
import '../components/main_screen/tracked_coins_text_widget.dart';
import '../components/main_screen/tracked_coins_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: MainScreenAppBar(),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                OverviewAndDateWidget(),
                SizedBox(height: 10),
                FeerAndGreedIndexWidget(),
                SizedBox(height: 10),
                MarketCapAndVolumeWidget(),
                SizedBox(height: 15),
                TrackedCoinsTextWidget(),
                SizedBox(height: 15),
                TrackedCoinsWidget(),
                SizedBox(height: 15),
                CoinstoWathTextWidget(),
                SizedBox(height: 10),
                CoinstoWatchWidget(),
                SizedBox(height: 15),
                MostImportantDevelopmentsTextWidget(),
                SizedBox(height: 10),
                MostImportantDevelopmentsWidget(),
                SizedBox(height: 15)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
