import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/appcolors/appcolors.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';

class SkillItem extends StatelessWidget {
  final String skill;
  const SkillItem({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 100.w,
      height: 73.h,
      decoration: BoxDecoration(
        color: Appcolors.secondary,
        borderRadius: BorderRadius.circular(50.r),
        border: Border.all(width: 1.w, color: Colors.white),
      ),
      child: Text(skill, style: Appstyles.secondary.copyWith(fontSize: 25.sp)),
    );
  }
}
