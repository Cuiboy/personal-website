import 'package:flutter/material.dart';
import 'package:personal_website/helpers/global.dart';
import 'package:personal_website/helpers/elements.dart';
import 'package:personal_website/helpers/objects.dart';
import 'dart:js' as js;

class HomeMobile extends StatefulWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  _HomeMobileState createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile>
    with SingleTickerProviderStateMixin {
  late AnimationController iconController;
  ScrollController scrollController = ScrollController();
  late ScrollController innerScrollController;
  bool menuVisible = false;
  bool overlayVisible = false;
  bool menuItemsVisible = false;
  bool animateForward = true;
  bool buttonTapDown = false;
  bool showBackToTop = false;
  double heightDelta = 0;

  scrollTo(double height, {double? heightPercent}) {
    double finalHeight = height;
    double finalHeightPercent = heightPercent ?? 0.6;
    if (height > 300) {
      finalHeight = finalHeightPercent * height * heightRatio + (1.0 - finalHeightPercent) * height * widthRatio;
    }
    innerScrollController.animateTo(finalHeight,
        duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
  }

  expandMenu() {
    setState(() {
      menuVisible = !menuVisible;
      animateForward = true;
    });
    menuVisible ? iconController.forward() : iconController.reverse();
    Future.delayed(const Duration(milliseconds: 100)).then((_) {
      setState(() {
        overlayVisible = true;
      });
    });
    Future.delayed(const Duration(milliseconds: 300)).then((_) {
      setState(() {
        menuItemsVisible = true;
      });
    });
  }

  collapseMenu() {
    setState(() {
      animateForward = false;
    });
    Future.delayed(const Duration(milliseconds: 10)).then((_) {
      setState(() {
        menuItemsVisible = false;
        menuVisible = !menuVisible;
      });
      menuVisible ? iconController.forward() : iconController.reverse();
    });
    Future.delayed(const Duration(milliseconds: 200)).then((_) {
      setState(() {
        overlayVisible = false;
      });
    });
  }

  Widget buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 60 * heightRatio),
        FadeIn(
          50,
          true,
          Text("Hi, my name is",
              style: WebFont.medium(
                  size: 15 * widthRatio, color: WebColors.highlight)),
        ),
        FadeIn(200, true,
            Text("Patrick Cui", style: WebFont.bold(size: 40 * widthRatio))),
        FadeIn(
          350,
          true,
          Text("I design & build",
              style: WebFont.bold(
                  size: 36 * widthRatio, color: WebColors.textLight)),
        ),
        FadeIn(
          500,
          true,
          Text("cool stuff.",
              style: WebFont.bold(
                  size: 36 * widthRatio, color: WebColors.textLight)),
        ),
        SizedBox(height: 20 * widthRatio),
        FadeIn(
          650,
          true,
          SizedBox(
            width: 300 * widthRatio,
            height: 100 * widthRatio,
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                text: "I'm a ",
                style: WebFont.regular(
                    size: 14 * widthRatio, color: WebColors.text),
              ),
              TextSpan(
                text: "software engineer ",
                style: WebFont.regular(
                    size: 14 * widthRatio, color: WebColors.highlight),
              ),
              TextSpan(
                text: "& ",
                style: WebFont.regular(
                    size: 14 * widthRatio, color: WebColors.text),
              ),
              TextSpan(
                text: "UX Designer ",
                style: WebFont.regular(
                    size: 14 * widthRatio, color: WebColors.highlight),
              ),
              TextSpan(
                text:
                    " who spends his time building & designing exceptional digital experineces. Currenlty, I’m a student studying ",
                style: WebFont.regular(
                    size: 14 * widthRatio, color: WebColors.text, height: 1.8),
              ),
              TextSpan(
                text: "EECS ",
                style: WebFont.regular(
                    size: 14 * widthRatio, color: WebColors.highlight),
              ),
              TextSpan(
                text: "at ",
                style: WebFont.regular(
                    size: 14 * widthRatio, color: WebColors.text),
              ),
              TextSpan(
                text: "UC Berkeley",
                style: WebFont.regular(
                    size: 14 * widthRatio, color: WebColors.highlight),
              ),
              TextSpan(
                text: ".",
                style: WebFont.regular(
                    size: 14 * widthRatio, color: WebColors.text),
              ),
            ])),
          ),
        ),
        SizedBox(height: 60 * heightRatio),
        FadeIn(
          800,
          true,
          WebButton(
            text: "Explore",
            onPressed: () {
              scrollTo(600);
            }
          ),
        ),
        SizedBox(
          height: 180 * heightRatio,
        )
      ],
    );
  }

  Widget buildExpCard(Experience exp) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0 * widthRatio),
      child: WebCard(
        width: 330 * widthRatio,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Padding(
              padding: EdgeInsets.all(30 * widthRatio),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    exp.tag,
                    style: WebFont.regular(
                        size: 12 * widthRatio, color: WebColors.highlight),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.0 * widthRatio),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: exp.pos,
                            style: WebFont.bold(
                                size: 18 * widthRatio, color: WebColors.text)),
                        TextSpan(
                            text: (exp.employer != null) ? " @ " : "",
                            style: WebFont.bold(
                                size: 18 * widthRatio,
                                color: WebColors.highlight)),
                        TextSpan(
                            text: exp.employer ?? "",
                            style: WebFont.bold(
                                size: 18 * widthRatio,
                                color: WebColors.highlight)),
                      ]),
                    ),
                  ),
                  Text(
                    exp.startEnd(),
                    style: WebFont.regular(size: 12 * widthRatio),
                  ),
                  SizedBox(height: 20 * widthRatio),
                  Text(
                    exp.desc,
                    style: WebFont.regular(size: 14 * widthRatio, height: 1.8),
                  ),
                  SizedBox(height: 50 * widthRatio),
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.all(14 * widthRatio),
                  child: IconButton(
                      icon: Icon(
                        exp.altIcon ?? Icons.open_in_new,
                        color: WebColors.highlight,
                      ),
                      onPressed: () {
                        js.context.callMethod('open', [exp.url]);
                      }),
                ))
          ],
        ),
      ),
    );
  }

  Widget buildExp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.0 * widthRatio),
          child: Text(
            "What I’ve been up to.",
            style: WebFont.bold(size: 24 * widthRatio),
          ),
        ),
        SizedBox(
          height: 20 * widthRatio,
        ),
        buildExpCard(Experience.derivative),
        buildExpCard(Experience.octo),
        buildExpCard(Experience.bm),
        buildExpCard(Experience.decode),
        buildExpCard(Experience.freelance),
        SizedBox(height: 60 * widthRatio),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    iconController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
  }

  @override
  Widget build(BuildContext context) {
    widthRatio = MediaQuery.of(context).size.width / 375.0;
    heightRatio = MediaQuery.of(context).size.height / 635.0;
    return Scaffold(
      backgroundColor: WebColors.background,
      body: Stack(
        children: [
          NestedScrollView(
            floatHeaderSlivers: true,
            headerSliverBuilder: (context, innerBoxScrolled) => [
              SliverAppBar(
                backgroundColor: WebColors.background,
                floating: true,
                toolbarHeight: 80 * widthRatio,
                actions: [
                  Padding(
                    padding: EdgeInsets.only(right: 10.0 * widthRatio),
                    child: IconButton(
                      icon: AnimatedIcon(
                        icon: AnimatedIcons.menu_close,
                        progress: iconController,
                      ),
                      onPressed: () =>
                          menuVisible ? collapseMenu() : expandMenu(),
                    ),
                  )
                ],
                centerTitle: true,
              )
            ],
            body: Builder(builder: (context) {
              innerScrollController = PrimaryScrollController.of(context)!;
              innerScrollController.addListener(() {
                setState(() {
                  heightDelta = innerScrollController.position.pixels;
                });
                if (innerScrollController.position.pixels != 0) {
                  if (showBackToTop == false) {
                    setState(() {
                      showBackToTop = true;
                    });
                  }
                } else {
                  if (showBackToTop) {
                    setState(() {
                      showBackToTop = false;
                    });
                  }
                }
              });
              return Padding(
                padding: EdgeInsets.only(
                    left: 20.0 * widthRatio, right: 20 * widthRatio),
                child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      switch (index) {
                        case 0:
                          return buildHeader();
                        case 1:
                          return buildExp();
                        default:
                          return Container();
                      }
                    }),
              );
            }),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              heightDelta.toString(),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
                padding: EdgeInsets.only(
                    bottom: 24 * widthRatio, right: 4 * widthRatio),
                child: AnimatedScale(
                  scale: (showBackToTop) ? 1 : 0,
                  duration: const Duration(milliseconds: 150),
                  child: RawMaterialButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    fillColor: WebColors.highlight,
                    onPressed: () {
                      innerScrollController.animateTo(-60.0,
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 300));
                    },
                    shape: const CircleBorder(),
                    padding: EdgeInsets.all(12 * widthRatio),
                    child: Icon(Icons.arrow_upward, color: WebColors.text),
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(top: 80.0 * widthRatio),
            child: Visibility(
              visible: overlayVisible,
              child: AnimatedOpacity(
                opacity: (menuItemsVisible) ? 1 : 0,
                duration: const Duration(milliseconds: 200),
                child: InkWell(
                  splashColor: Colors.transparent,
                  onTap: collapseMenu,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height:
                        MediaQuery.of(context).size.height - 80 * widthRatio,
                    color: WebColors.background.withOpacity(0.85),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 80.0 * widthRatio),
            child: AnimatedContainer(
              width: MediaQuery.of(context).size.width,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn,
              height: (menuVisible) ? 300 * widthRatio : 0,
              color: Colors.black.withOpacity(0.7),
              child: Visibility(
                visible: menuItemsVisible,
                child: Column(
                  children: [
                    FadeIn(
                      0,
                      animateForward,
                      TextButton(
                          onPressed: () {
                            collapseMenu();
                            scrollTo(600);
                          },
                          child: Text(
                            "Experience",
                            style: WebFont.bold(
                                size: 18 * widthRatio, color: WebColors.text),
                          )),
                    ),
                    FadeIn(
                      100,
                      animateForward,
                      TextButton(
                          onPressed: () {
                            collapseMenu();
                          },
                          child: Text(
                            "Projects",
                            style: WebFont.bold(
                                size: 18 * widthRatio, color: WebColors.text),
                          )),
                    ),
                    FadeIn(
                      200,
                      animateForward,
                      TextButton(
                          onPressed: () {
                            collapseMenu();
                          },
                          child: Text(
                            "Hobbies",
                            style: WebFont.bold(
                                size: 18 * widthRatio, color: WebColors.text),
                          )),
                    ),
                    SizedBox(height: 20 * widthRatio),
                    FadeIn(
                        300,
                        animateForward,
                        WebButton(
                            text: "Resume",
                            width: 155 * widthRatio,
                            height: 54 * widthRatio,
                            onPressed: () {}))
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
