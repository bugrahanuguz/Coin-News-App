import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/text_style.dart';

class ExploreScreenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ExploreScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      title: Text(
        "Search",
        style: boldWhiteTextStyle(30),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
