import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CertificateItem extends StatelessWidget {
  final String image;
  const CertificateItem({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width * .3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
      ),
    );
  }
}
