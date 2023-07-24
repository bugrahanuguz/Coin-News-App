import 'package:coin_news_app/viewmodel/firebase_analtyics.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/colors.dart';
import '../../viewmodel/amplitude.dart';
import '../../viewmodel/coins_view_model.dart';

class ExploreScreenSearchBar extends StatelessWidget {
  const ExploreScreenSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return Container(
      height: MediaQuery.of(context).size.height * 0.058,
      decoration: BoxDecoration(
          color: widgetbackground, borderRadius: BorderRadius.circular(11)),
      child: TextField(
        onTap: () {
          AmplitudeConnection.search_tab_tapped();
          FirebaseAnalyticsService.search_tab_tapped();
        },
        onChanged: (value) {
          Provider.of<CoinsViewModel>(context, listen: false)
              .searchCoins(value);
        },
        cursorWidth: 1,
        style: const TextStyle(color: Colors.white),
        controller: searchController,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(top: 5),
            hintText: "Search",
            hintStyle: TextStyle(
                color: Color(0xFF8E8E92),
                fontSize: 19,
                fontWeight: FontWeight.bold),
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              size: 25,
              color: Colors.white,
            )),
      ),
    );
  }
}
