import 'package:flutter/material.dart';
import '../components/coins_screen/coins_app_bar.dart';
import '../components/coins_screen/news_page/news_page.dart';
import '../components/coins_screen/overview_page/overview_page.dart';

class CoinsScreen extends StatelessWidget {
  const CoinsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List list = [1];
    List tweetList = [1];
    bool isAdd = true;
    return DefaultTabController(
      length: list.isNotEmpty ? 2 : 1,
      child: Scaffold(
        appBar: CoinsScreenAppBar(
          list: list,
          isAdd: isAdd,
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            OverviewPage(
              isAdd: isAdd,
            ),
            if (list.isNotEmpty) ...[
              NewsPage(tweetList: tweetList),
            ]
          ],
        ),
      ),
    );
  }
}
