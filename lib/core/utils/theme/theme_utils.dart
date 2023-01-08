import 'package:flutter/material.dart';

class ThemeUtils{
  static getColorFromHex(String hex){
    return Color.fromARGB(
      255,
      int.parse(hex.substring(1, 3), radix: 16),
      int.parse(hex.substring(3, 5), radix: 16),
      int.parse(hex.substring(5, 7), radix: 16),
    );
  }
}