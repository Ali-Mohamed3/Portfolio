import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/core/appassets/appassets.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/education/mobile_education.dart';
import 'package:my_portfolio/view/widgets/education/education_widget.dart';
import 'package:my_portfolio/view/widgets/scroll_animation.dart';

class MobileEducationSection extends StatefulWidget {
  const MobileEducationSection({super.key});

  @override
  State<MobileEducationSection> createState() => _MobileEducationSectionState();
}

class _MobileEducationSectionState extends State<MobileEducationSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScrollAnimation(
          childW: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectableText(
                "Education",
                style: Appstyles.primary.copyWith(fontSize: 35.sp),
              ),
              SizedBox(width: 16.w),
              SvgPicture.asset(
                AppAssets.education,
                width: 40.w,
                height: 40.h,
                color: Colors.white,
              ),
            ],
          ),
          duration: Duration(milliseconds: 750),
        ),

        SizedBox(height: 40.h),
        ScrollAnimation(
          childW: IntrinsicWidth(child: MobileEducation()),
          duration: Duration(milliseconds: 750),
        ),
      ],
    );
  }
}
