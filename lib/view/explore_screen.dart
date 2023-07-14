import 'package:flutter/material.dart';
import '../components/coins_widget.dart';
import '../components/explore_screen/explore_screen_app_bar.dart';
import '../components/explore_screen/search_bar.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ExploreScreenAppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              ExploreScreenSearchBar(),
              SizedBox(height: 10),
              CoinsWidget(
                isExplore: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
