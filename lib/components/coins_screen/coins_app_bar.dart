import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CoinsScreenAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CoinsScreenAppBar({
    super.key,
    required this.list,
    required this.isAdd,
  });

  final List list;
  final bool isAdd;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset("assets/buttons/back_button.png")),
      actions: [
        isAdd == true
            ? GestureDetector(
                onTap: () {},
                child: Image.asset(
                  "assets/buttons/bell_fill.png",
                ))
            : GestureDetector(
                onTap: () {},
                child: Image.asset(
                  "assets/buttons/bell.png",
                )),
      ],
      title: Center(
        child: Container(
          width: list.isNotEmpty
              ? MediaQuery.of(context).size.width * 0.8
              : MediaQuery.of(context).size.width * 0.33,
          height: MediaQuery.of(context).size.height * 0.046,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(9)),
          child: TabBar(
            overlayColor: MaterialStatePropertyAll(Colors.transparent),
            splashFactory: NoSplash.splashFactory,
            indicator: BoxDecoration(
                color: widgetbackground,
                borderRadius: BorderRadius.circular(9)),
            indicatorSize: TabBarIndicatorSize.tab,
            dividerColor: Colors.transparent,
            labelColor: coinNewsColor,
            unselectedLabelColor: Colors.white,
            tabs: [
              const Tab(
                child: Text(
                  "Overview",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              if (list.isNotEmpty) ...[
                const Tab(
                  child: Text(
                    "News",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                )
              ]
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
