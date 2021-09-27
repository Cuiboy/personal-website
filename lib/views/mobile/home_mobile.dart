import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js' as js;
import 'dart:html' as html;
import 'package:personal_website/helpers/web_icons.dart';
import 'package:personal_website/helpers/global.dart';
import 'package:personal_website/helpers/elements.dart';
import 'package:personal_website/helpers/objects.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  _HomeMobileState createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile>
    with SingleTickerProviderStateMixin {
  late AnimationController iconController;
  AutoScrollController scrollController = AutoScrollController();
  bool menuVisible = false;
  bool overlayVisible = false;
  bool menuItemsVisible = false;
  bool animateForward = true;
  bool buttonTapDown = false;
  bool showBackToTop = false;
  bool showTab = true;
  double heightDelta = 0;

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
        SizedBox(height: 120 * heightRatio),
        FadeIn(
          50,
          true,
          Text("Hi, my name is",
              style: WebFont.medium(
                  size: 15 * widthRatio, color: WebColors.highlight)),
        ),
        FadeIn(200, true,
            Text("Patrick Cui.", style: WebFont.bold(size: 40 * widthRatio))),
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
                    size: 14 * widthRatio, color: WebColors.text, height: 1.8),
              ),
              TextSpan(
                text: "software engineer ",
                style: WebFont.regular(
                    size: 14 * widthRatio, color: WebColors.highlight, height: 1.8),
              ),
              TextSpan(
                text: "& ",
                style: WebFont.regular(
                    size: 14 * widthRatio, color: WebColors.text, height: 1.8),
              ),
              TextSpan(
                text: "UX Designer ",
                style: WebFont.regular(
                    size: 14 * widthRatio, color: WebColors.highlight, height: 1.8),
              ),
              TextSpan(
                text:
                    " who spends his time building & designing exceptional digital experineces. Currently, I’m a student studying ",
                style: WebFont.regular(
                    size: 14 * widthRatio, color: WebColors.text, height: 1.8),
              ),
              TextSpan(
                text: "EECS ",
                style: WebFont.regular(
                    size: 14 * widthRatio, color: WebColors.highlight, height: 1.8),
              ),
              TextSpan(
                text: "at ",
                style: WebFont.regular(
                    size: 14 * widthRatio, color: WebColors.text, height: 1.8),
              ),
              TextSpan(
                text: "UC Berkeley",
                style: WebFont.regular(
                    size: 14 * widthRatio, color: WebColors.highlight, height: 1.8),
              ),
              TextSpan(
                text: ".",
                style: WebFont.regular(
                    size: 14 * widthRatio, color: WebColors.text, height: 1.8),
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
                scrollController.scrollToIndex(1, preferPosition: AutoScrollPosition.begin);
              }),
        ),
        SizedBox(
          height: 100 * heightRatio,
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
                  padding: EdgeInsets.all(18 * widthRatio),
                  child: IconButton(
                      padding: EdgeInsets.all(8 * widthRatio),
                      iconSize: 24 * widthRatio,
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
        SizedBox(
          height: 80 * heightRatio,
        ),
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
        SizedBox(height: 30 * widthRatio),
      ],
    );
  }

  Widget buildProjCard(Project proj) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20 * widthRatio),
      child: WebCard(
          width: 330 * widthRatio,
          child: Padding(
            padding: EdgeInsets.all(30.0 * widthRatio),
            child: Column(
              children: [
                Text(
                  "Featured Proejdct",
                  style: WebFont.regular(
                    size: 12 * widthRatio,
                    color: WebColors.highlight,
                  ),
                ),
                SizedBox(height: 6 * widthRatio),
                Text(
                  proj.name,
                  style: WebFont.bold(
                      size: 32 * widthRatio, color: WebColors.text),
                ),
                SizedBox(height: 10 * widthRatio),
                SizedBox(
                  width: 250 * widthRatio,
                  child: Text(
                    proj.desc,
                    textAlign: TextAlign.center,
                    style: WebFont.regular(size: 13 * widthRatio, height: 1.8),
                  ),
                ),
                SizedBox(height: 30 * widthRatio),
                ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(36 * widthRatio)),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Container(
                      width: 130 * widthRatio,
                      height: 130 * widthRatio,
                      color: const Color(0xff171717),
                      child: Image.asset(proj.imgPath),
                    ),
                  ),
                ),
                SizedBox(height: 50 * widthRatio),
                (proj.available)
                    ? IconButton(
                        iconSize: 24 * widthRatio,
                        icon: Icon(
                          Icons.open_in_new,
                          color: WebColors.highlight,
                        ),
                        onPressed: () {
                          js.context.callMethod('open', [proj.url]);
                        },
                      )
                    : Container(
                        width: 120 * widthRatio,
                        height: 30 * widthRatio,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(15 * widthRatio)),
                          border: Border.all(
                              color: const Color(0xffF2994A), width: 1),
                        ),
                        child: Center(
                            child: Text("Coming Soon",
                                style: WebFont.regular(
                                    size: 12 * widthRatio, color: const Color(0xffF2994A)))),
                      ),
              ],
            ),
          )),
    );
  }

  Widget buildProj() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30 * widthRatio),
        Padding(
          padding: EdgeInsets.only(left: 8.0 * widthRatio),
          child: Text(
            "Cool things I've built.",
            style: WebFont.bold(size: 24 * widthRatio),
          ),
        ),
        SizedBox(
          height: 20 * widthRatio,
        ),
        buildProjCard(Project.integral),
        buildProjCard(Project.broomstick),
        buildProjCard(Project.packmat),
        SizedBox(height: 30 * widthRatio),
      ],
    );
  }

  Widget buildDrone() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20 * widthRatio),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(20 * widthRatio)),
        child: Container(
          width: 330 * widthRatio,
          height: 440 * widthRatio,
          decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/images/drone-bg.jpg"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.all(Radius.circular(20 * widthRatio))),
          child: Stack(
            children: [
              Container(
                  width: 330 * widthRatio,
                  height: 440 * widthRatio,
                  color: WebColors.cards.withOpacity(0.5)),
              Padding(
                padding: EdgeInsets.all(25 * widthRatio),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hobby",
                      style: WebFont.regular(size: 12 * widthRatio),
                    ),
                    SizedBox(height: 4 * widthRatio),
                    Text("Drone Photography",
                        style: WebFont.bold(
                            size: 32 * widthRatio, color: WebColors.text)),
                    SizedBox(height: 20 * widthRatio),
                    Text(
                      "I love flying drones at beautiful places & capture the world from above.",
                      style: WebFont.bold(
                          size: 16 * widthRatio, color: WebColors.text),
                    )
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.all(14 * widthRatio),
                    child: IconButton(
                        iconSize: 24 * widthRatio,
                        icon: Icon(
                          WebIcons.instagram,
                          color: WebColors.text,
                        ),
                        onPressed: () {
                          js.context.callMethod('open',
                              ["https://www.instagram.com/patrick.drone/"]);
                        }),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Widget buildVidEdit() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0 * widthRatio),
      child: Container(
          width: 330 * widthRatio,
          height: 440 * widthRatio,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20 * widthRatio)),
              gradient: const LinearGradient(
                  colors: [Color(0xff5F3232), Color(0xff423361)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight)),
          child: Stack(
            children: [
              Padding(
                  padding: EdgeInsets.all(25 * widthRatio),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hobby",
                        style: WebFont.regular(size: 12 * widthRatio),
                      ),
                      SizedBox(height: 4 * widthRatio),
                      Text("Film Making",
                          style: WebFont.bold(
                              size: 32 * widthRatio, color: WebColors.text)),
                      SizedBox(height: 20 * widthRatio),
                      Text(
                        "I love telling stories & expressing myself through film & video editing.",
                        style: WebFont.bold(
                            size: 16 * widthRatio, color: WebColors.text),
                      )
                    ],
                  )),
              Positioned(
                  left: 34 * widthRatio,
                  top: 180 * widthRatio,
                  child: Image.asset("assets/images/videoEditing-bg.png",
                      width: 390 * widthRatio)),
            ],
          )),
    );
  }

  Widget buildBball() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0 * widthRatio),
      child: Container(
          width: 330 * widthRatio,
          height: 220 * widthRatio,
          decoration: BoxDecoration(
              color: const Color(0xff8A501D),
              borderRadius: BorderRadius.all(Radius.circular(20 * widthRatio))),
          padding: EdgeInsets.all(30 * widthRatio),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hobby",
                style: WebFont.regular(size: 12 * widthRatio),
              ),
              SizedBox(height: 4 * widthRatio),
              Text("Basketball",
                  style: WebFont.bold(
                      size: 32 * widthRatio, color: WebColors.text)),
              SizedBox(height: 20 * widthRatio),
              Text(
                "I don’t always make my jumpers, but I’m always down to hoop.",
                style:
                    WebFont.bold(size: 16 * widthRatio, color: WebColors.text),
              )
            ],
          )),
    );
  }

  Widget buildPiano() {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.0 * widthRatio),
      child: WebCard(
          width: 330 * widthRatio,
          height: 260 * widthRatio,
          child: Padding(
            padding: EdgeInsets.all(30.0 * widthRatio),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hobby",
                  style: WebFont.regular(size: 12 * widthRatio),
                ),
                SizedBox(height: 4 * widthRatio),
                Text("Piano",
                    style: WebFont.bold(
                        size: 32 * widthRatio, color: WebColors.text)),
                SizedBox(height: 20 * widthRatio),
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text:
                          "I’ve been playing the piano since the age of 3. My favorite composers are ",
                      style: WebFont.bold(
                          size: 16 * widthRatio, color: WebColors.text),
                    ),
                    TextSpan(
                        text: "Claude Debussy",
                        style: WebFont.bold(
                                size: 16 * widthRatio, color: WebColors.text)
                            .apply(decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => js.context.callMethod('open', [
                                "https://en.wikipedia.org/wiki/Claude_Debussy"
                              ])),
                    TextSpan(
                      text: " & ",
                      style: WebFont.bold(
                          size: 16 * widthRatio, color: WebColors.text),
                    ),
                    TextSpan(
                        text: "Franz Liszt",
                        style: WebFont.bold(
                                size: 16 * widthRatio, color: WebColors.text)
                            .apply(decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => js.context.callMethod('open',
                              ["https://en.wikipedia.org/wiki/Franz_Liszt"])),
                    TextSpan(
                      text: ".",
                      style: WebFont.bold(
                          size: 16 * widthRatio, color: WebColors.text),
                    ),
                  ]),
                )
              ],
            ),
          )),
    );
  }

  Widget buildHobbies() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30 * widthRatio),
        Padding(
          padding: EdgeInsets.only(left: 8.0 * widthRatio),
          child: Text(
            "Stuff I enjoy doing.",
            style: WebFont.bold(size: 24 * widthRatio),
          ),
        ),
        SizedBox(
          height: 20 * widthRatio,
        ),
        buildDrone(),
        buildVidEdit(),
        buildBball(),
        buildPiano()
      ],
    );
  }

  Widget buildFooter() {
    return Column(
      children: [
        SizedBox(height: 40 * widthRatio),
        Text("Get in Touch.",
            style: WebFont.bold(size: 40 * widthRatio, color: WebColors.text)),
        SizedBox(height: 12 * widthRatio),
        SizedBox(
            width: 320 * widthRatio,
            child: Text(
                "If you would like to reach out to me with any project ideas, work opportunities, or just want to say hello, my inbox is always open.",
                textAlign: TextAlign.center,
                style: WebFont.medium(
                    size: 15 * widthRatio, color: WebColors.text))),
        SizedBox(height: 25 * widthRatio),
        WebButton(
          text: "Say Hello",
          onPressed: () {
            js.context.callMethod('open', ['mailto:work@cuipatrick.com']);
          },
        ),
        SizedBox(height: 40 * widthRatio),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(WebIcons.github, color: WebColors.highlight),
              onPressed: () {
                webLaunch("https://github.com/Cuiboy");
              },
            ),
            IconButton(
              icon: Icon(WebIcons.facebook, color: WebColors.highlight),
              onPressed: () =>
                  webLaunch("https://www.facebook.com/patrickk.cui"),
            ),
            IconButton(
              icon: Icon(WebIcons.instagram, color: WebColors.highlight),
              onPressed: () =>
                  webLaunch("https://www.instagram.com/patrickk.cui/"),
            ),
            IconButton(
              icon: Icon(WebIcons.linkedin, color: WebColors.highlight),
              onPressed: () =>
                  webLaunch("https://www.linkedin.com/in/cuipatrick/"),
            ),
            IconButton(
              icon: Icon(Icons.description, color: WebColors.highlight),
              onPressed: () => webLaunch(resumeLink),
            ),
          ],
        ),
        SizedBox(height: 30 * widthRatio),
        Text("Designed & Built by Patrick Cui",
            style: WebFont.bold(size: 15 * widthRatio, color: WebColors.text)),
        SizedBox(height: 100 * widthRatio),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    iconController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
    scrollController.addListener(() {
      if (scrollController.position.pixels > 100) {
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
       if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        setState(() {
          showTab = true;
        });
      } else {
        setState(() {
          showTab = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    widthRatio = MediaQuery.of(context).size.width / 375.0;
    heightRatio = MediaQuery.of(context).size.height / 635.0;
    return Scaffold(
      backgroundColor: WebColors.background,
      body: Stack(
        children: [
          Center(
            child: Scrollbar(
              controller: scrollController,
              child: Padding(
                padding: EdgeInsets.only(
                    left: 20.0 * widthRatio, right: 20 * widthRatio),
                child: ListView.builder(
                    itemCount: 5,
                    controller: scrollController,
                    itemBuilder: (context, index) {
                      switch (index) {
                        case 0:
                          return AutoScrollTag(
                              key: ValueKey(index),
                              controller: scrollController,
                              index: index,
                              child: buildHeader());
                        case 1:
                          return AutoScrollTag(
                              key: ValueKey(index),
                              controller: scrollController,
                              index: index,
                              child: buildExp());
                        case 2:
                          return AutoScrollTag(
                              key: ValueKey(index),
                              controller: scrollController,
                              index: index,
                              child: buildProj());
                        case 3:
                          return AutoScrollTag(
                              key: ValueKey(index),
                              controller: scrollController,
                              index: index,
                              child: buildHobbies());
                        case 4:
                          return AutoScrollTag(
                              key: ValueKey(index),
                              controller: scrollController,
                              index: index,
                              child: buildFooter());
                        default:
                          return Container();
                      }
                    }),
              ),
            ),
          ),
          AnimatedPositioned(
              top: showTab ? 0 : -80 * widthRatio,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 80 * widthRatio,
                color: WebColors.background,
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 20.0 * widthRatio),
                      child: IconButton(
                        iconSize: 24 * widthRatio,
                        icon: AnimatedIcon(
                          icon: AnimatedIcons.menu_close,
                          progress: iconController,
                        ),
                        onPressed: () =>
                            menuVisible ? collapseMenu() : expandMenu(),
                      ),
                    )),
              ),
              duration: const Duration(milliseconds: 250)),
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
                    onPressed: () async {
                      await scrollController.animateTo(0.0,
                          curve: Curves.easeOut,
                          duration: Duration(
                              milliseconds: 300 + (heightDelta / 100).round()));
                      setState(() {
                        showTab = true;
                      });
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
              color: WebColors.background,
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
                            Future.delayed(const Duration(milliseconds: 200))
                                .then((_) {
                              scrollController.scrollToIndex(1, preferPosition: AutoScrollPosition.begin);
                            });
                          },
                          child: Text(
                            "Experience",
                            style: WebFont.bold(
                                size: 18 * widthRatio, color: WebColors.text),
                          )),
                    ),
                    SizedBox(height: 12 * heightRatio,),
                    FadeIn(
                      100,
                      animateForward,
                      TextButton(
                          onPressed: () {
                            collapseMenu();
                            Future.delayed(const Duration(milliseconds: 500))
                                .then((_) {
                              scrollController.scrollToIndex(2, preferPosition: AutoScrollPosition.begin);
                            });
                          },
                          child: Text(
                            "Projects",
                            style: WebFont.bold(
                                size: 18 * widthRatio, color: WebColors.text),
                          )),
                    ),
                    SizedBox(height: 12 * heightRatio,),
                    FadeIn(
                      200,
                      animateForward,
                      TextButton(
                          onPressed: () {
                            collapseMenu();
                            Future.delayed(const Duration(milliseconds: 400))
                                .then((_) {
                              scrollController.scrollToIndex(3, preferPosition: AutoScrollPosition.begin);
                            });
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
                            textSize: 16 * widthRatio,
                            width: 155 * widthRatio,
                            height: 54 * widthRatio,
                            onPressed: () => webLaunch(
                                "https://drive.google.com/file/d/1L40zBZc5E-IyETSuzS810Co9k0wyUbyn/view?usp=sharing")))
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
