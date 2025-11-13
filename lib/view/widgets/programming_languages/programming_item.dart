import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/appcolors/appcolors.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';

class ProgrammingItem extends StatelessWidget {
  final String language;
  const ProgrammingItem({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 100.w,
      height: 73.h,
      decoration: BoxDecoration(
        color: Appcolors.secondary,
        borderRadius: BorderRadius.circular(25.r),
        border: Border(
          left: BorderSide(width: 10.w, color: Appcolors.text),
          right: BorderSide(width: 1.w, color: Appcolors.text),
          top: BorderSide(width: 1.w, color: Appcolors.text),
          bottom: BorderSide(width: 1.w, color: Appcolors.text),
        ),
      ),
      child: Row(
        children: [
          SizedBox(width: 10.w),

          SelectableText(
            language,
            style: Appstyles.secondary.copyWith(fontSize: 25.sp),
          ),
        ],
      ),
    );
  }
}
