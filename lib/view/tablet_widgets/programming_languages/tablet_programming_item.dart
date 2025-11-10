import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/appcolors/appcolors.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';

class TabletProgrammingItem extends StatelessWidget {
  final String language;
  const TabletProgrammingItem({super.key, required this.language});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0.sp),
      child: Container(
        alignment: Alignment.center,
        width: 100.w,
        height: 110.h,
        decoration: BoxDecoration(
          color: Appcolors.secondary,
          borderRadius: BorderRadius.circular(40.r),
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

            SelectableText(
              language,
              style: Appstyles.secondary.copyWith(fontSize: 20.sp),
            ),
          ],
        ),
      ),
    );
  }
}
