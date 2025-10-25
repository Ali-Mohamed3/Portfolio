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
      width: 500.w,
      height: 600.h,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
      child: Column(
        children: [
          Row(
            children: [
              Image.network(image, height: 400.h),
              Image.network(image2, height: 400.h),
              Image.network(image3, height: 400.h),
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
