import 'package:coin_news_app/components/main_screen/show_news_widget.dart';
import 'package:coin_news_app/components/main_screen/show_tweets_widget.dart';
import 'package:coin_news_app/constants/colors.dart';
import 'package:coin_news_app/constants/text_style.dart';
import 'package:coin_news_app/model/news_model.dart';
import 'package:coin_news_app/model/top_coin_model.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatelessWidget {
  const NewsPage(
      {super.key,
      required this.tweetList,
      required this.newsList,
      required this.coin});
  final List tweetList;
  final List<NewsModel?> newsList;
  final TopCoinModel coin;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildScreenTitle(coin),
            const SizedBox(height: 10),
            if (tweetList.isNotEmpty) ...[
              buildTweetsTitle(),
              const SizedBox(height: 10),
              buildTweets(coin),
              const SizedBox(height: 10),
              buildNewsTitle(),
            ],
            const SizedBox(height: 5),
            buildNews(newsList, coin)
          ],
        ),
      ),
    );
  }

  Text buildScreenTitle(TopCoinModel coin) {
    return Text(
      coin.name!,
      style: boldWhiteTextStyle(28),
    );
  }

  Text buildNewsTitle() {
    return Text(
      "${coin.name} News",
      style: boldWhiteTextStyle(18),
    );
  }

  Text buildTweetsTitle() {
    return Text(
      "Hand Picked Tweets",
      style: TextStyle(
          color: coinNewsColor, fontSize: 18, fontWeight: FontWeight.w600),
    );
  }

  Flexible buildTweets(TopCoinModel coin) {
    return Flexible(
      fit: FlexFit.loose,
      flex: 0,
      child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: ((context, index) => ShowTweetsWidget(
                isTappedMid: false,
                coin: coin,
              )),
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemCount: 2),
    );
  }

  Flexible buildNews(List<NewsModel?> newsList, TopCoinModel coin) {
    return Flexible(
      fit: FlexFit.loose,
      child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: ((context, index) => ShowNewsWidget(
              news: newsList[index], isTappedMid: false, coin: coin)),
          separatorBuilder: (context, index) => const SizedBox(height: 15),
          itemCount: newsList.length),
    );
  }
}
