import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabletPhotoWidget extends StatefulWidget {
  final String url;
  const TabletPhotoWidget({super.key, required this.url});

  @override
  State<TabletPhotoWidget> createState() => _TabletPhotoWidgetState();
}

class _TabletPhotoWidgetState extends State<TabletPhotoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.w,
      height: 500.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(widget.url, scale: 3.8),
          fit: BoxFit.none,
          // scale: .1,
        ),
        boxShadow: [
          BoxShadow(color: Colors.white, blurRadius: 20, spreadRadius: 5),
        ],
      ),
    );
  }
}
