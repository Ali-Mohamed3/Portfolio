import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhotoWidget extends StatelessWidget {
  final String url;
  const PhotoWidget({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width * 0.21;
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            blurRadius: 20.sp,
            spreadRadius: 10.sp,
            color: Colors.white,
          ),
        ],
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
