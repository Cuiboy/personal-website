import 'package:flutter/material.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;

class WebFont {
  static TextStyle bold({required double size, Color? color}) {
    return TextStyle(
        fontSize: size,
        color: color,
        fontFamily: 'SF',
        fontWeight: (isWebMobile) ? FontWeight.w800 : FontWeight.w700);
  }

  static TextStyle medium({required double size, Color? color, double? height}) {
    return TextStyle(
        fontSize: size,
        color: color,
        fontFamily: 'SF',
        height: height,
        fontWeight: FontWeight.w500);
  }

  static TextStyle semibold({required double size, Color? color}) {
    return TextStyle(
        fontSize: size,
        color: color,
        fontFamily: 'SF',
        fontWeight: FontWeight.w600);
  }

  static TextStyle regular(
      {required double size, Color? color, double? height}) {
    return TextStyle(
        fontSize: size, color: color, fontFamily: 'SF', height: height);
  }
}

class WebColors {
  static Color text = Colors.white;
  static Color textLight = const Color(0xffE0E0E0);
  static Color highlight = const Color(0xff25B1F9);
  static Color background = Colors.black;
  static Color cards = const Color(0xff1d2838);
}

double widthRatio = 1;
double heightRatio = 1;
bool isWebMobile = false;

webLaunch(String url) {
  js.context.callMethod('open', [url]);
}

const String resumeLink = "https://drive.google.com/file/d/1L40zBZc5E-IyETSuzS810Co9k0wyUbyn/view?usp=sharing";
