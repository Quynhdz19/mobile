import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_front_end/utils/constants.dart';

class FlipAnimation extends StatefulWidget {
  const FlipAnimation(
      {required this.word,
      required this.animate,
      required this.reverse,
      required this.animationComplete,
      this.delay = 0,
      Key? key})
      : super(key: key);

  final Widget word;
  final bool animate;
  final bool reverse;
  final Function(bool) animationComplete;
  final int delay;

  @override
  State<FlipAnimation> createState() => _FlipAnimationState();
}

class _FlipAnimationState extends State<FlipAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 1000), vsync: this)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              print("animation forward");
              widget.animationComplete.call(true);
            }
            if (status == AnimationStatus.dismissed) {
              print("animation reversed");
              widget.animationComplete.call(false);
            }
          });

    animation = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: controller, curve: Curves.bounceInOut));

    // controller.forward();
  }

  @override
  void didUpdateWidget(covariant FlipAnimation oldWidget) {
    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) {
        if (widget.animate) {
          if (widget.reverse) {
            controller.reverse();
          } else {
            controller.reset();
            controller.forward();
          }
        }
      }
    });

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..rotateY(animation.value * pi)
          ..setEntry(3, 2, 0.005),
        child: controller.value >= 0.5
            ? widget.word
            : Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/card.jpeg'),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black26, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFFAFAFA),
                      blurRadius: 0.5,
                      offset: Offset(1, 2), // Shadow position
                    ),
                  ],
                ),
                child: Icon(
                  Icons.question_mark,
                  size: 50,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
