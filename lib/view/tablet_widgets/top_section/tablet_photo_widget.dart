import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/appcolors/appcolors.dart';

class TabletPhotoWidget extends StatefulWidget {
  final String url;
  const TabletPhotoWidget({super.key, required this.url});

  @override
  State<TabletPhotoWidget> createState() => _TabletPhotoWidgetState();
}

class _TabletPhotoWidgetState extends State<TabletPhotoWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.4;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,

        boxShadow: [
          BoxShadow(
            color: Appcolors.text,
            blurRadius: 10.sp,
            spreadRadius: 5.sp,
          ),
        ],
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(widget.url),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
