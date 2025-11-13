import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/core/appassets/appassets.dart';
import 'package:my_portfolio/core/appcolors/appcolors.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';

class SkillItem extends StatelessWidget {
  final String skill;
  const SkillItem({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 50.sp, vertical: 10.sp),

          decoration: BoxDecoration(
            color: Appcolors.secondary,
            borderRadius: BorderRadius.circular(50.r),
            border: Border.all(width: 1.w, color: Appcolors.text),
          ),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              SvgPicture.asset(AppAssets.bulb, width: 70.w, height: 70.h),
              SizedBox(height: 20.h),
              SelectableText(
                skill,
                style: Appstyles.secondary.copyWith(fontSize: 25.sp),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ],
    );
  }
}
