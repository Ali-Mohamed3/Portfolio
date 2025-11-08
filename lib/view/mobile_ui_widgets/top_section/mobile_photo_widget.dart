import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobilePhotoWidget extends StatefulWidget {
  final String url;
  const MobilePhotoWidget({super.key, required this.url});

  @override
  State<MobilePhotoWidget> createState() => _MobilePhotoWidgetState();
}

class _MobilePhotoWidgetState extends State<MobilePhotoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.w,
      height: 400.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,

        boxShadow: [
          BoxShadow(color: Colors.white, blurRadius: 20, spreadRadius: 5),
        ],
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(widget.url),
              fit: BoxFit.none,
              scale: 4.3,
            ),
          ),
        ),
      ),
    );
  }
}
