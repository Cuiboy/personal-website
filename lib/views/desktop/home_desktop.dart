import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:personal_website/helpers/web_icons.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:personal_website/helpers/global.dart';
import 'package:personal_website/helpers/objects.dart';
import 'package:personal_website/helpers/elements.dart';

class HomeDesktop extends StatefulWidget {
  const HomeDesktop({Key? key}) : super(key: key);

  @override
  _HomeDesktopState createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
  AutoScrollController scrollController = AutoScrollController();
  double horizontalPadding = 200;
  double heightDelta = 0;
  bool showBackToTop = false;
  bool showTab = false;

  Widget buildTabs() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 120 * widthRatio,
        color: WebColors.background,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => scrollController.scrollToIndex(1,
                  preferPosition: AutoScrollPosition.begin),
              child: Text(
                "Experience",
                style: WebFont.regular(
                    size: 18 * widthRatio, color: WebColors.textLight),
              ),
            ),
            SizedBox(
              width: 20 * widthRatio,
            ),
            TextButton(
              onPressed: () => scrollController.scrollToIndex(2,
                  preferPosition: AutoScrollPosition.begin),
              child: Text(
                "Projects",
                style: WebFont.regular(
                    size: 18 * widthRatio, color: WebColors.textLight),
              ),
            ),
            SizedBox(
              width: 20 * widthRatio,
            ),
            TextButton(
              onPressed: () => scrollController.scrollToIndex(3,
                  preferPosition: AutoScrollPosition.begin),
              child: Text(
                "Hobbies",
                style: WebFont.regular(
                    size: 18 * widthRatio, color: WebColors.textLight),
              ),
            ),
            SizedBox(
              width: 20 * widthRatio,
            ),
            TextButton(
              onPressed: () => scrollController.scrollToIndex(4,
                  preferPosition: AutoScrollPosition.begin),
              child: Text(
                "Contact",
                style: WebFont.regular(
                    size: 18 * widthRatio, color: WebColors.textLight),
              ),
            ),
            SizedBox(
              width: 20 * widthRatio,
            ),
            WebButton(
              width: 150 * widthRatio,
              height: 50 * widthRatio,
              text: "Resume",
              textSize: 22 * widthRatio,
              onPressed: () => launch(resumeLink),
            ),
            SizedBox(
              width: 80 * widthRatio,
            )
          ],
        ));
  }

  Widget buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 284 * widthRatio),
        FadeIn(
          50,
          true,
          Text("Hi, my name is",
              style: WebFont.medium(
                  size: 24 * widthRatio, color: WebColors.highlight)),
        ),
        SizedBox(height: 12 * widthRatio),
        FadeIn(
            200,
            true,
            Text("Patrick Cui.",
                style: WebFont.semibold(size: 80 * widthRatio))),
        FadeIn(
          350,
          true,
          Text("I design & build cool stuff.",
              style: WebFont.semibold(
                  size: 80 * widthRatio, color: WebColors.textLight)),
        ),
        SizedBox(height: 20 * widthRatio),
        FadeIn(
          650,
          true,
          SizedBox(
            width: 600 * widthRatio,
            height: 150 * widthRatio,
            child: RichText(
                text: TextSpan(children: [
              TextSpan(
                text: "I'm a ",
                style: WebFont.regular(
                    size: 24 * widthRatio, color: WebColors.text),
              ),
              TextSpan(
                text: "software engineer ",
                style: WebFont.regular(
                    size: 24 * widthRatio, color: WebColors.highlight),
              ),
              TextSpan(
                text: "& ",
                style: WebFont.regular(
                    size: 24 * widthRatio, color: WebColors.text),
              ),
              TextSpan(
                text: "UX Designer ",
                style: WebFont.regular(
                    size: 24 * widthRatio, color: WebColors.highlight),
              ),
              TextSpan(
                text:
                    " who spends his time building & designing exceptional digital experineces. Currenlty, I’m a student studying ",
                style: WebFont.regular(
                    size: 24 * widthRatio, color: WebColors.text, height: 1.8),
              ),
              TextSpan(
                text: "EECS ",
                style: WebFont.regular(
                    size: 24 * widthRatio, color: WebColors.highlight),
              ),
              TextSpan(
                text: "at ",
                style: WebFont.regular(
                    size: 24 * widthRatio, color: WebColors.text),
              ),
              TextSpan(
                text: "UC Berkeley",
                style: WebFont.regular(
                    size: 24 * widthRatio, color: WebColors.highlight),
              ),
              TextSpan(
                text: ".",
                style: WebFont.regular(
                    size: 24 * widthRatio, color: WebColors.text),
              ),
            ])),
          ),
        ),
        SizedBox(height: 60 * widthRatio),
        FadeIn(
          800,
          true,
          WebButton(
              width: 220 * widthRatio,
              height: 71 * widthRatio,
              textSize: 22 * widthRatio,
              text: "Explore",
              onPressed: () {
                scrollController.scrollToIndex(1,
                    preferPosition: AutoScrollPosition.begin);
              }),
        ),
        SizedBox(
          height: 250 * widthRatio,
        )
      ],
    );
  }

  Widget buildExpCard(Experience exp, bool short) {
    return WebCard(
      width: (short ? 940 : 520) * widthRatio,
      height: (short ? 350 : 540) * widthRatio,
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
                      size: 16 * widthRatio, color: WebColors.highlight),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0 * widthRatio),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: exp.pos,
                          style: WebFont.semibold(
                              size: 30 * widthRatio, color: WebColors.text)),
                      TextSpan(
                          text: (exp.employer != null) ? " @ " : "",
                          style: WebFont.semibold(
                              size: 30 * widthRatio,
                              color: WebColors.highlight)),
                      TextSpan(
                          text: exp.employer ?? "",
                          style: WebFont.semibold(
                              size: 30 * widthRatio,
                              color: WebColors.highlight)),
                    ]),
                  ),
                ),
                Text(
                  exp.startEnd(),
                  style: WebFont.regular(size: 16 * widthRatio),
                ),
                SizedBox(height: 20 * widthRatio),
                Text(
                  exp.desc,
                  style: WebFont.regular(size: 20 * widthRatio, height: 1.8),
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
                    iconSize: 36 * widthRatio,
                    onPressed: () {
                      launch(exp.url);
                    }),
              ))
        ],
      ),
    );
  }

  Widget buildExp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 55 * widthRatio),
        Padding(
          padding: EdgeInsets.only(left: 16.0 * widthRatio),
          child: Text(
            "What I’ve been up to.",
            style: WebFont.semibold(size: 48 * widthRatio),
          ),
        ),
        SizedBox(height: 60 * widthRatio),
        Row(
          children: [
            Column(
              children: [
                buildExpCard(Experience.derivative, true),
                SizedBox(height: 36 * widthRatio),
                buildExpCard(Experience.bmDesktop, true),
                SizedBox(height: 36 * widthRatio),
                buildExpCard(Experience.freelance, true),
              ],
            ),
            SizedBox(width: 36 * widthRatio),
            Column(
              children: [
                buildExpCard(Experience.octo, false),
                SizedBox(height: 36 * widthRatio),
                buildExpCard(Experience.decode, false),
              ],
            )
          ],
        ),
        SizedBox(height: 150 * widthRatio)
      ],
    );
  }

  Widget buildProjCard(Project proj) {
    return WebCard(
        width: 470 * widthRatio,
        height: 670 * widthRatio,
        child: Padding(
          padding: EdgeInsets.all(25.0 * widthRatio),
          child: Column(
            children: [
              SizedBox(height: 20 * widthRatio),
              Text(
                "Featured Proejdct",
                style: WebFont.regular(
                  size: 16 * widthRatio,
                  color: WebColors.highlight,
                ),
              ),
              SizedBox(height: 12 * widthRatio),
              Text(
                proj.name,
                style: WebFont.semibold(
                    size: 40 * widthRatio, color: WebColors.text),
              ),
              SizedBox(height: 10 * widthRatio),
              SizedBox(
                width: 350 * widthRatio,
                child: Text(
                  proj.desc,
                  textAlign: TextAlign.center,
                  style: WebFont.regular(size: 20 * widthRatio, height: 1.8),
                ),
              ),
              SizedBox(height: 50 * widthRatio),
              Text(
                proj.stack!,
                style: WebFont.regular(
                    size: 16 * widthRatio, color: const Color(0xffF2C94C)),
              ),
              SizedBox(height: 50 * widthRatio),
              ClipRRect(
                borderRadius:
                    BorderRadius.all(Radius.circular(36 * widthRatio)),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Container(
                    width: 150 * widthRatio,
                    height: 150 * widthRatio,
                    color: const Color(0xff171717),
                    child: Image.asset(proj.imgPath),
                  ),
                ),
              ),
              SizedBox(height: 40 * widthRatio),
              (proj.available)
                  ? IconButton(
                      padding: EdgeInsets.all(8 * widthRatio),
                      icon: Icon(
                        Icons.open_in_new,
                        color: WebColors.highlight,
                      ),
                      iconSize: 36 * widthRatio,
                      onPressed: () {
                        launch(proj.url!);
                      },
                    )
                  : Container(
                      width: 150 * widthRatio,
                      height: 40 * widthRatio,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(20 * widthRatio)),
                        border: Border.all(
                            color: const Color(0xffF2994A), width: 1),
                      ),
                      child: Center(
                          child: Text("Coming Soon",
                              style: WebFont.regular(
                                  size: 14 * widthRatio,
                                  color: const Color(0xffF2994A)))),
                    ),
            ],
          ),
        ));
  }

  Widget buildProj() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 80 * widthRatio),
        Padding(
          padding: EdgeInsets.only(left: 16.0 * widthRatio),
          child: Text(
            "Things I've Built.",
            style: WebFont.semibold(size: 48 * widthRatio),
          ),
        ),
        SizedBox(height: 60 * widthRatio),
        Row(
          children: [
            buildProjCard(Project.integral),
            SizedBox(width: 40 * widthRatio),
            buildProjCard(Project.broomstick),
            SizedBox(width: 40 * widthRatio),
            buildProjCard(Project.packmat),
          ],
        ),
        SizedBox(height: 170 * widthRatio)
      ],
    );
  }

  Widget buildDrone() {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20 * widthRatio)),
      child: Container(
        width: 740 * widthRatio,
        height: 440 * widthRatio,
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage("assets/images/drone-bg.jpg"),
                fit: BoxFit.cover),
            borderRadius: BorderRadius.all(Radius.circular(20 * widthRatio))),
        child: Stack(
          children: [
            Container(
                width: 755 * widthRatio,
                height: 440 * widthRatio,
                color: WebColors.cards.withOpacity(0.5)),
            Padding(
              padding: EdgeInsets.all(40 * widthRatio),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hobby",
                    style: WebFont.regular(size: 16 * widthRatio),
                  ),
                  SizedBox(height: 4 * widthRatio),
                  Text("Drone Photography",
                      style: WebFont.semibold(
                          size: 40 * widthRatio, color: WebColors.text)),
                  SizedBox(height: 20 * widthRatio),
                  SizedBox(
                    width: 400 * widthRatio,
                    child: Text(
                      "I love flying drones at beautiful places & capture the world from above.",
                      style: WebFont.medium(
                          size: 24 * widthRatio, color: WebColors.text),
                    ),
                  )
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.all(14 * widthRatio),
                  child: IconButton(
                      icon: Icon(
                        WebIcons.instagram,
                        color: WebColors.text,
                      ),
                      onPressed: () {
                        launch("https://www.instagram.com/patrick.drone/");
                      }),
                ))
          ],
        ),
      ),
    );
  }

  Widget buildVidEdit() {
    return Container(
        width: 740 * widthRatio,
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
                padding: EdgeInsets.all(40 * widthRatio),
                child: SizedBox(
                  width: 260 * widthRatio,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hobby",
                        style: WebFont.regular(size: 16 * widthRatio),
                      ),
                      SizedBox(height: 4 * widthRatio),
                      Text("Film Making",
                          style: WebFont.semibold(
                              size: 40 * widthRatio, color: WebColors.text)),
                      SizedBox(height: 20 * widthRatio),
                      Text(
                        "I love telling stories & expressing myself through film & video editing.",
                        style: WebFont.medium(
                            size: 24 * widthRatio, color: WebColors.text),
                      )
                    ],
                  ),
                )),
            Positioned(
                left: 300 * widthRatio,
                top: 60 * widthRatio,
                child: Image.asset("assets/images/videoEditing-bg.png",
                    height: 300 * widthRatio)),
          ],
        ));
  }

  Widget buildBball() {
    return Container(
        width: 740 * widthRatio,
        height: 280 * widthRatio,
        decoration: BoxDecoration(
            color: const Color(0xff8A501D),
            borderRadius: BorderRadius.all(Radius.circular(20 * widthRatio))),
        padding: EdgeInsets.all(40 * widthRatio),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hobby",
              style: WebFont.regular(size: 16 * widthRatio),
            ),
            SizedBox(height: 4 * widthRatio),
            Text("Basketball",
                style: WebFont.semibold(
                    size: 40 * widthRatio, color: WebColors.text)),
            SizedBox(height: 20 * widthRatio),
            SizedBox(
              width: 400 * widthRatio,
              child: Text(
                "I don’t always make my jumpers, but I’m always down to hoop.",
                style: WebFont.medium(
                    size: 24 * widthRatio, color: WebColors.text),
              ),
            )
          ],
        ));
  }

  Widget buildPiano() {
    return WebCard(
        width: 740 * widthRatio,
        height: 280 * widthRatio,
        child: Padding(
          padding: EdgeInsets.all(40.0 * widthRatio),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hobby",
                style: WebFont.regular(size: 16 * widthRatio),
              ),
              SizedBox(height: 4 * widthRatio),
              Text("Piano",
                  style: WebFont.semibold(
                      size: 40 * widthRatio, color: WebColors.text)),
              SizedBox(height: 20 * widthRatio),
              SizedBox(
                width: 600 * widthRatio,
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text:
                          "I’ve been playing the piano since the age of 3. My favorite composers are ",
                      style: WebFont.medium(
                          size: 24 * widthRatio, color: WebColors.text),
                    ),
                    TextSpan(
                        text: "Claude Debussy",
                        style: WebFont.semibold(
                                size: 24 * widthRatio, color: WebColors.text)
                            .apply(decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launch(
                              "https://en.wikipedia.org/wiki/Claude_Debussy")),
                    TextSpan(
                      text: " & ",
                      style: WebFont.semibold(
                          size: 24 * widthRatio, color: WebColors.text),
                    ),
                    TextSpan(
                        text: "Franz Liszt",
                        style: WebFont.semibold(
                                size: 24 * widthRatio, color: WebColors.text)
                            .apply(decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launch(
                              "https://en.wikipedia.org/wiki/Franz_Liszt")),
                    TextSpan(
                      text: ".",
                      style: WebFont.semibold(
                          size: 24 * widthRatio, color: WebColors.text),
                    ),
                  ]),
                ),
              )
            ],
          ),
        ));
  }

  Widget buildHobbies() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 80 * widthRatio),
        Padding(
          padding: EdgeInsets.only(left: 16.0 * widthRatio),
          child: Text(
            "Stuff I enjoy doing.",
            style: WebFont.semibold(size: 48 * widthRatio),
          ),
        ),
        SizedBox(height: 60 * widthRatio),
        Row(
          children: [
            Column(
              children: [
                buildDrone(),
                SizedBox(height: 30 * widthRatio),
                buildBball()
              ],
            ),
            SizedBox(width: 30 * widthRatio),
            Column(
              children: [
                buildPiano(),
                SizedBox(height: 30 * widthRatio),
                buildVidEdit()
              ],
            )
          ],
        ),
        SizedBox(height: 100 * widthRatio)
      ],
    );
  }

  Widget buildFooter() {
    return Column(
      children: [
        SizedBox(height: 100 * widthRatio),
        Text("Get in Touch.",
            style:
                WebFont.semibold(size: 80 * widthRatio, color: WebColors.text)),
        SizedBox(height: 24 * widthRatio),
        SizedBox(
            width: 740 * widthRatio,
            child: Text(
                "If you would like to reach out to me with any project ideas, work opportunities, or just want to say hello, my inbox is always open.",
                textAlign: TextAlign.center,
                style: WebFont.medium(
                  height: 1.4,
                  size: 24 * widthRatio,
                  color: WebColors.text,
                ))),
        SizedBox(height: 48 * widthRatio),
        WebButton(
          width: 260 * widthRatio,
          height: 100 * widthRatio,
          text: "Say Hello",
          textSize: 24 * widthRatio,
          onPressed: () {
            launch('mailto:work@cuipatrick.com');
          },
        ),
        SizedBox(height: 250 * widthRatio),
        Text("Designed & Built by Patrick Cui",
            style:
                WebFont.medium(size: 16 * widthRatio, color: WebColors.text)),
        SizedBox(height: 20 * widthRatio),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 400)).then((_) {
      setState(() {
        showTab = true;
      });
    });
    scrollController.addListener(() {
      setState(() {
        heightDelta = scrollController.position.pixels;
      });
      if (scrollController.position.pixels > 300) {
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
    horizontalPadding = 200 * widthRatio;
    widthRatio = MediaQuery.of(context).size.width / 1920;
    heightRatio = MediaQuery.of(context).size.height / 1080;
    return Scaffold(
      backgroundColor: WebColors.background,
      body: Stack(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  itemCount: 5,
                  controller: scrollController,
                  padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
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
                  })),
          AnimatedPositioned(
            top: (showTab) ? 0 : -120,
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            left: 0,
            child: buildTabs(),
          ),
          FadeIn(
            500,
            true,
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 50.0 * widthRatio),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(WebIcons.github, color: WebColors.highlight),
                      onPressed: () {
                        launch("https://github.com/Cuiboy");
                      },
                    ),
                    SizedBox(height: 8 * widthRatio),
                    IconButton(
                      icon: Icon(WebIcons.facebook, color: WebColors.highlight),
                      onPressed: () =>
                          launch("https://www.facebook.com/patrickk.cui"),
                    ),
                    SizedBox(height: 8 * widthRatio),
                    IconButton(
                      icon: Icon(WebIcons.instagram, color: WebColors.highlight),
                      onPressed: () =>
                          launch("https://www.instagram.com/patrickk.cui/"),
                    ),
                    SizedBox(height: 8 * widthRatio),
                    IconButton(
                      icon: Icon(WebIcons.linkedin, color: WebColors.highlight),
                      onPressed: () =>
                          launch("https://www.linkedin.com/in/cuipatrick/"),
                    ),
                    SizedBox(height: 8 * widthRatio),
                    IconButton(
                      icon: Icon(Icons.description, color: WebColors.highlight),
                      onPressed: () => launch(resumeLink),
                    ),
                    SizedBox(height: 16 * widthRatio),
                    Container(
                        width: 1,
                        height: 130 * widthRatio,
                        color: WebColors.highlight),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
                padding: EdgeInsets.only(
                    bottom: 48 * widthRatio, right: 24 * widthRatio),
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
                    padding: EdgeInsets.all(15 * widthRatio),
                    child: Icon(
                      Icons.arrow_upward,
                      color: WebColors.text,
                      size: 36 * widthRatio,
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
