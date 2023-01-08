import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../features/splash/data/modals/custom_theme_model.dart';

class ThemeUtils {
  static getColorFromHex(String hex) {
    return Color.fromARGB(
      255,
      int.parse(hex.substring(1, 3), radix: 16),
      int.parse(hex.substring(3, 5), radix: 16),
      int.parse(hex.substring(5, 7), radix: 16),
    );
  }

  static TextStyle getTextStyle(Map<String, dynamic> json) {

    return GoogleFonts.getFont(
      json['font_family'],
      color: getColorFromHex(json['text_color']),
      fontWeight: _numericToFontWeight(int.parse(json['font_weight'])),
      fontSize: parseSize(json['font_size']),
    );
  }

  static FontWeight _numericToFontWeight(int value) {

    return FontWeight.values.firstWhere(
        (weight) => weight.index == (value / 100) - 1,
        orElse: () => FontWeight.w400);
  }

  TextAlign parseTextAlign(String value) {
    final alignments = {
      'center': TextAlign.center,
      'left': TextAlign.left,
      'right': TextAlign.right,
      'justify': TextAlign.justify,
    };
    return alignments[value] ?? TextAlign.start;
  }

  static double parseSize(String fontSize) {
    final val= double.parse(fontSize.substring(0, fontSize.length - 2));
    print(val);
    return val;
  }
}
