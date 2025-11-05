import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CursorAnimation extends StatefulWidget {
  final Widget childW;
  const CursorAnimation({super.key, required this.childW});

  @override
  State<CursorAnimation> createState() => _CursorAnimationState();
}

class _CursorAnimationState extends State<CursorAnimation> {
  bool _isIn = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() {
        _isIn = true;
      }),
      onExit: (_) => setState(() {
        _isIn = false;
      }),
      child: AnimatedScale(
        scale: _isIn ? 1.1 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: Wrap(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                color: _isIn
                    ? Colors.redAccent.withOpacity(0.4)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: widget.childW,
            ),
          ],
        ),
      ),
    );
  }
}
