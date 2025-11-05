import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/appcolors/appcolors.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';

class MobileProjectItem extends StatelessWidget {
  final String name;
  final String image;
  final String image2;
  final String image3;
  const MobileProjectItem({
    super.key,
    required this.image,
    required this.name,
    required this.image2,
    required this.image3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 602.w,
      height: 100.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(width: 1.sp, color: Colors.white),
        color: Appcolors.secondary,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: image,
                  height: 400.h,
                  width: 200.w,
                  fit: BoxFit.fill,
                ),
                CachedNetworkImage(
                  imageUrl: image2,
                  height: 400.h,
                  width: 200.w,
                  fit: BoxFit.fill,
                ),
                CachedNetworkImage(
                  imageUrl: image3,
                  height: 400.h,
                  width: 200.w,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Center(child: SelectableText(name, style: Appstyles.primary)),
        ],
      ),
    );
  }
}
