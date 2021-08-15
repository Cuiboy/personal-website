
import 'package:flutter/material.dart';

class WebFont {
  static TextStyle bold(double size, Color color) {
    return TextStyle(fontSize: size, color: color, fontFamily: 'SF', fontWeight: FontWeight.w800);
  }
  static TextStyle medium(double size, Color color) {
    return TextStyle(fontSize: size, color: color, fontFamily: 'SF', fontWeight: FontWeight.w500);
  }
  static TextStyle regular(double size, Color color) {
    return TextStyle(fontSize: size, color: color, fontFamily: 'SF');
  }
}
  
class WebColors {
  static Color text = Colors.white;
  static Color textLight = const Color(0xffE0E0E0);
  static Color highlight = const Color(0xff25B1F9);
  static Color background = Colors.black;
  static Color cards = const Color(0xff1d2838);
}
