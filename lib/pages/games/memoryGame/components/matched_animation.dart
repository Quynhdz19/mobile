import 'package:flutter/cupertino.dart';
import 'package:mobile_front_end/utils/constants.dart';

class MatchedAnimation extends StatefulWidget {
  const MatchedAnimation(
      {Key? key,
      required this.child,
      required this.animate})
      : super(key: key);

  final Widget child;
  final bool animate;
  @override
  State<MatchedAnimation> createState() => _MatchedAnimationState();
}

class _MatchedAnimationState extends State<MatchedAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> shake, scale;

  Color defaultColor = Color(0xFFE1F5FE), correctColor = greenColor;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(milliseconds: 800), vsync: this);

    shake = TweenSequence<double>([
      TweenSequenceItem(tween: Tween<double>(begin: 0.0, end: 0.12), weight: 3),
      TweenSequenceItem(
          tween: Tween<double>(begin: 0.12, end: -0.08), weight: 5),
      TweenSequenceItem(
          tween: Tween<double>(begin: -0.08, end: 0.04), weight: 5),
      TweenSequenceItem(
          tween: Tween<double>(begin: 0.04, end: 0.00), weight: 6),
    ]).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    scale = TweenSequence<double>([
      TweenSequenceItem(tween: Tween<double>(begin: 1.0, end: 0.9), weight: 7),
      TweenSequenceItem(tween: Tween<double>(begin: 0.9, end: 1.0), weight: 3),
    ]).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
  }

  @override
  void didUpdateWidget(covariant MatchedAnimation oldWidget) {
    if (widget.animate) {
      controller.forward();
    }
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
          ..rotateZ(shake.value)
          ..scale(scale.value)
          ..setEntry(3, 2, 0.003),
        child: Container(
            // decoration: BoxDecoration(
            //     color: widget.animate ? correctColor : defaultColor),
            child: widget.child),
      ),
    );
  }
}
