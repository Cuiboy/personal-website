import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';
import 'package:flutter/material.dart';
import 'global.dart';

// ignore: must_be_immutable
class WebCard extends StatelessWidget {
  double? width;
  double? height;
  Widget? child;
  WebCard({Key? key, this.width, this.height, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: WebColors.cards,
          borderRadius: BorderRadius.all(Radius.circular(20 * widthRatio))),
      child: Padding(
        padding: EdgeInsets.all(8.0 * widthRatio),
        child: child,
      ),
    );
  }
}

enum AnimationType { moveUp, fadeIn }

class FadeIn extends StatelessWidget {
  final int delay;
  final Widget child;
  final bool start;

  const FadeIn(this.delay, this.start, this.child, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tween = MultiTween<AnimationType>()
      ..add(AnimationType.fadeIn, 0.0.tweenTo(1.0), 200.milliseconds)
      ..add(AnimationType.moveUp, 10.tweenTo(0), 200.milliseconds);
    return CustomAnimation(
      delay: delay.milliseconds,
      control: start
          ? CustomAnimationControl.play
          : CustomAnimationControl.playReverse,
      tween: tween,
      duration: tween.duration,
      child: child,
      builder: (BuildContext context, Widget? child,
              MultiTweenValues<AnimationType> animation) =>
          Opacity(
              opacity: animation.get(AnimationType.fadeIn),
              child: Transform.translate(
                  offset: Offset(0, animation.get(AnimationType.moveUp)),
                  child: child)),
    );
  }
}

class WebButton extends StatefulWidget {
  final String text;
  final double width;
  final double height;
  final double textSize;
  final Function? onPressed;

  const WebButton({
    Key? key,
    this.text = "",
    this.width = 150,
    this.height = 50,
    this.textSize = 16,
    this.onPressed,
  }) : super(key: key);

  @override
  _WebButtonState createState() => _WebButtonState();
}

class _WebButtonState extends State<WebButton> {
  bool buttonTapDown = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          buttonTapDown = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          buttonTapDown = false;
        });
      },
      onTap: () {
        if (widget.onPressed != null) {
          setState(() {
            buttonTapDown = true;
          });
          widget.onPressed!();
          Future.delayed(const Duration(milliseconds: 300)).then((_) {
            setState(() {
              buttonTapDown = false;
            });
          });
        }
      },
      child: AnimatedContainer(
        width: widget.width,
        height: widget.height,
        duration: const Duration(milliseconds: 100),
        decoration: BoxDecoration(
            color: (buttonTapDown) ? WebColors.highlight : Colors.transparent,
            border: Border.all(width: 1, color: WebColors.highlight),
            borderRadius:
                BorderRadius.all(Radius.circular(widget.width * 0.5))),
        child: Center(
            child: Text(widget.text,
                style: WebFont.regular(
                    size: widget.textSize,
                    color: (buttonTapDown)
                        ? WebColors.text
                        : WebColors.highlight))),
      ),
    );
  }
}
