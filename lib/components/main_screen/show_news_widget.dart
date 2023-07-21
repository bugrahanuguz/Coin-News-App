import 'package:coin_news_app/viewmodel/news_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants/colors.dart';
import '../../constants/text_style.dart';
import '../../model/news_model.dart';
import '../../viewmodel/change_screens.dart';

class ShowNewsWidget extends StatelessWidget {
  const ShowNewsWidget({
    super.key,
    required this.news,
  });
  final NewsModel? news;

  @override
  Widget build(BuildContext context) {
    String imageUrl = news?.image ?? "assets/splash_icon.png";
    String publishTime =
        context.read<NewsViewModel>().timeAgo(news!.publishedAt!);
    return GestureDetector(
      onTap: () {
        context.read<ChangeScreens>().launchInBrowser(Uri.parse(news!.url!));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.158,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: widgetbackground, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                imageUrl,
                width: 84,
                height: 84,
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  "assets/splash_icon.png",
                  width: 84,
                  height: 84,
                ),
              ),
            ), //size = 84
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(height: 10),
                Container(
                  width: MediaQuery.of(context).size.width * 0.66,
                  height: MediaQuery.of(context).size.height * 0.1,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    news?.title ?? "null",
                    style: boldWhiteTextStyle(14),
                  ),
                ),
                // SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    publishTime,
                    style: const TextStyle(
                        color: Color(0xFF7A7A7A),
                        fontSize: 11,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
