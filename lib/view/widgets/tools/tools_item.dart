import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/appcolors/appcolors.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';

class ToolsItem extends StatelessWidget {
  final String tool;
  const ToolsItem({super.key, required this.tool});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 73.h,
      decoration: BoxDecoration(
        color: Appcolors.secondary,
        borderRadius: BorderRadius.circular(25.r),
        border: Border(
          left: BorderSide(width: 10.w, color: Colors.white),
          right: BorderSide(width: 1.w, color: Colors.white),
          top: BorderSide(width: 1.w, color: Colors.white),
          bottom: BorderSide(width: 1.w, color: Colors.white),
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: 10.w),
          Icon(Icons.arrow_forward, size: 30.sp, color: Colors.white),
          SizedBox(width: 10.w),
          Text(tool, style: Appstyles.secondary.copyWith(fontSize: 25.sp)),
        ],
      ),
    );
  }
}
