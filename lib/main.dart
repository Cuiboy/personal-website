import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:personal_website/helpers/global.dart';
import 'package:personal_website/views/mobile/home_mobile.dart';
import 'package:personal_website/views/desktop/home_desktop.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patrick Cui',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, fontFamily: "SF"),
      home: const MainNavigation(),
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({Key? key}) : super(key: key);

  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {

  @override
  void initState() {
    super.initState();
    isWebMobile = kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.android);
  }

  @override
  Widget build(BuildContext context) {
    bool isVertical = MediaQuery.of(context).size.width /
            MediaQuery.of(context).size.height <=
        0.75;
    bool isNarrow = MediaQuery.of(context).size.width < 720;
    return (isWebMobile || isVertical || isNarrow)
                ? const HomeMobile()
                : const HomeDesktop();
  }
}
