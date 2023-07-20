import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ChangeScreens extends ChangeNotifier {
  late int selectedIndex = 0;

  int changeScreen(int index) {
    selectedIndex = index;
    notifyListeners();
    return selectedIndex;
  }

  Future<void> launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }


}
