import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhotoWidget extends StatefulWidget {
  const PhotoWidget({super.key});

  @override
  State<PhotoWidget> createState() => _PhotoWidgetState();
}

class _PhotoWidgetState extends State<PhotoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400.w,
      height: 500.h,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: 1.sp, color: Colors.white),
        image: DecorationImage(
          image: AssetImage(
            "assets/images/WhatsApp Image 2025-01-02 at 23.21.27_1dd4b8e5.jpg",
          ),
          fit: BoxFit.fill,
        ),
        boxShadow: [
          BoxShadow(color: Colors.white, blurRadius: 20, spreadRadius: 5),
        ],
      ),
    );
  }
}
