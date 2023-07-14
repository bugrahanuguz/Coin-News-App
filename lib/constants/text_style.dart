import 'package:flutter/material.dart';

TextStyle boldWhiteTextStyle(double size) {
  return TextStyle(
      color: Colors.white, fontWeight: FontWeight.w600, fontSize: size);
}

TextStyle tweetTextStyle(double size) {
  return TextStyle(
      color: const Color(0xFFC4C4C4),
      fontSize: size,
      fontWeight: FontWeight.bold);
}
