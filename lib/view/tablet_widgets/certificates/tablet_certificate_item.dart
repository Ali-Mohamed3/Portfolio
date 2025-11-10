import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabletCertificateItem extends StatelessWidget {
  final String image;
  const TabletCertificateItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * .55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
      ),
    );
  }
}
