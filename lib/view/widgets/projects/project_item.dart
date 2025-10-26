import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';

class ProjectItem extends StatelessWidget {
  final String name;
  final String image;
  final String image2;
  final String image3;
  const ProjectItem({
    super.key,
    required this.image,
    required this.name,
    required this.image2,
    required this.image3,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600.w,
      height: 900.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
      child: Column(
        children: [
          Row(
            children: [
              CachedNetworkImage(imageUrl: image, height: 420.h, width: 200.w),
              CachedNetworkImage(imageUrl: image2, height: 420.h, width: 200.w),
              CachedNetworkImage(imageUrl: image3, height: 420.h, width: 200.w),
            ],
          ),
          SizedBox(height: 50.h),
          Center(
            child: Text(
              name,
              style: Appstyles.primary.copyWith(fontSize: 30.sp),
            ),
          ),
        ],
      ),
    );
  }
}
