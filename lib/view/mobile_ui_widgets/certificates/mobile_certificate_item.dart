import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MobileCertificateItem extends StatelessWidget {
  final String image;
  const MobileCertificateItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * .8,
      height: 300.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
      ),
    );
  }
}
