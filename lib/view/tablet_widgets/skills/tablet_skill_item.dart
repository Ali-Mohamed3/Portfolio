import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/core/appassets/appassets.dart';
import 'package:my_portfolio/core/appcolors/appcolors.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/core/widgets/cursor_animation.dart';

class TabletSkillItem extends StatelessWidget {
  final String skill;
  const TabletSkillItem({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 50.sp, vertical: 20.sp),
          decoration: BoxDecoration(
            color: Appcolors.secondary,
            borderRadius: BorderRadius.circular(50.r),
            border: Border.all(width: 1.w, color: Appcolors.text),
          ),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              SvgPicture.asset(AppAssets.bulb, width: 90.w, height: 90.h),
              SizedBox(height: 25.h),
              SelectableText(
                skill,
                style: Appstyles.secondary.copyWith(fontSize: 20.sp),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ],
    );
  }
}
