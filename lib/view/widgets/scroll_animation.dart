import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ScrollAnimation extends StatefulWidget {
  final Widget childW;
  final Duration duration;
  final double? y;
  const ScrollAnimation({
    super.key,
    required this.childW,
    required this.duration,
    this.y,
  });

  @override
  State<ScrollAnimation> createState() => _ScrollAnimationState();
}

class _ScrollAnimationState extends State<ScrollAnimation> {
  bool _visible = false;
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key(widget.childW.hashCode.toString()),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > .3 && !_visible) {
          setState(() {
            _visible = true;
          });
        } else if (info.visibleFraction == 0 && _visible) {
          setState(() => _visible = false);
        }
      },
      child: AnimatedOpacity(
        opacity: _visible ? 1 : 0,
        duration: widget.duration,
        curve: Curves.easeOut,
        child: AnimatedSlide(
          offset: _visible ? Offset(0, 0) : Offset(0, .1),
          duration: widget.duration,
          curve: Curves.easeOut,
          child: widget.childW,
        ),
      ),
    );
  }
}
