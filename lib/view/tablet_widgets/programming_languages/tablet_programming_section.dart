import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/core/appassets/appassets.dart';
import 'package:my_portfolio/core/appcolors/appcolors.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/programming_languages/mobile_programming_langs.dart';
import 'package:my_portfolio/view/tablet_widgets/programming_languages/tablet_programming_langs.dart';
import 'package:my_portfolio/view/widgets/programming_languages/programming_langs.dart';
import 'package:my_portfolio/view/widgets/scroll_animation.dart';

class TabletProgrammingSection extends StatefulWidget {
  const TabletProgrammingSection({super.key});

  @override
  State<TabletProgrammingSection> createState() =>
      _TabletProgrammingSectionState();
}

class _TabletProgrammingSectionState extends State<TabletProgrammingSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScrollAnimation(
          childW: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectableText(
                "Programming languages",
                style: Appstyles.primary.copyWith(fontSize: 35.sp),
              ),
              SizedBox(width: 16.w),
              SvgPicture.asset(
                AppAssets.code,
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
          childW: TabletProgrammingLangs(),
          duration: Duration(milliseconds: 750),
        ),
      ],
    );
  }
}
