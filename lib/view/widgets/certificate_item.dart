import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CertificateItem extends StatelessWidget {
  final String image;
  const CertificateItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500.w,
      height: 400.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
      ),
    );
  }
}
