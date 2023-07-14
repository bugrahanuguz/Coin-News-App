import 'package:coin_news_app/view/bottom_nav_bar.dart';
import 'package:coin_news_app/viewmodel/change_screens.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ChangeScreens())],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: backgroundColor,
            useMaterial3: true,
            fontFamily: 'SF Pro Display'),
        home: BottomNavBar(),
      ),
    );
  }
}
