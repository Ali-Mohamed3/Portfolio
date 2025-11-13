import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/core/appassets/appassets.dart';
import 'package:my_portfolio/core/appcolors/appcolors.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/education/mobile_education.dart';
import 'package:my_portfolio/view/tablet_widgets/education/tablet_education.dart';
import 'package:my_portfolio/view/widgets/education/education_widget.dart';
import 'package:my_portfolio/view/widgets/scroll_animation.dart';

class TabletEducationSection extends StatefulWidget {
  const TabletEducationSection({super.key});

  @override
  State<TabletEducationSection> createState() => _TabletEducationSectionState();
}

class _TabletEducationSectionState extends State<TabletEducationSection> {
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
                width: 70.w,
                height: 70.h,
                color: Appcolors.text,
              ),
            ],
          ),
          duration: Duration(milliseconds: 750),
        ),

        SizedBox(height: 40.h),
        ScrollAnimation(
          childW: Wrap(children: [TabletEducation()]),
          duration: Duration(milliseconds: 750),
        ),
      ],
    );
  }
}
