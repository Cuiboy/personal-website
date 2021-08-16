// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'global.dart';

class WebCard extends StatelessWidget {
  double? width;
  double? height;
  Widget? child;
  WebCard({ Key? key, double? width, double? height, Widget? child }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: WebColors.cards,
        borderRadius: BorderRadius.all(Radius.circular(20 * widthRatio))
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0 * widthRatio),
        child: child,
      ),
    );
  }
}