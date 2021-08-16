import 'package:flutter/material.dart';
import 'package:personal_website/helpers/global.dart';
import 'package:personal_website/helpers/elements.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({Key? key}) : super(key: key);

  @override
  _HomeMobileState createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile>
    with SingleTickerProviderStateMixin {
  late AnimationController iconController;
  ScrollController scrollController = ScrollController();
  late ScrollController? innerScrollController;
  bool menuVisible = false;
  bool overlayVisible = false;
  bool menuItemsVisible = false;
  bool animateForward = true;
  bool buttonTapDown = false;

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
                      onPressed: () => menuVisible ? collapseMenu() : expandMenu(),
                    ),
                  )
                ],
                centerTitle: true,
              )
            ],
            body: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(23.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      color: WebColors.cards,
                    ),
                  );
                }),
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
                      height: MediaQuery.of(context).size.height - 80 * widthRatio,
                      color: WebColors.background.withOpacity(0.75),
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
                        WebButton(text: "Resume", width: 155 * widthRatio, height: 54 * widthRatio, onPressed: (){})
                      )
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
