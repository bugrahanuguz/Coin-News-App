import 'package:coin_news_app/components/main_screen/show_news_widget.dart';
import 'package:coin_news_app/components/main_screen/show_tweets_widget.dart';
import 'package:flutter/material.dart';


class MostImportantDevelopmentsWidget extends StatelessWidget {
  const MostImportantDevelopmentsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return  Column(
          children: [
            // ShowNewsWidget(isTappedMid: true,),
            const SizedBox(height: 15),
            ShowTweetsWidget(isTappedMid: true,orderIndex: (index+1).toString(),)
          ],
        );
      },
      itemCount: 2,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 15);
      },
    );
  }
}
