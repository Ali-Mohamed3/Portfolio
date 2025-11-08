import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhotoWidget extends StatelessWidget {
  final String url;
  const PhotoWidget({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.w,
      height: 500.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: NetworkImage(url), fit: BoxFit.fill),
        boxShadow: [
          BoxShadow(color: Colors.white, blurRadius: 20, spreadRadius: 5),
        ],
      ),
    );
  }
}
