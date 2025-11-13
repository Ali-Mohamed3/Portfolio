import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/core/appassets/appassets.dart';
import 'package:my_portfolio/core/appcolors/appcolors.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/programming_languages/mobile_programming_langs.dart';
import 'package:my_portfolio/view/widgets/programming_languages/programming_langs.dart';
import 'package:my_portfolio/view/widgets/scroll_animation.dart';

class MobileProgrammingSection extends StatefulWidget {
  const MobileProgrammingSection({super.key});

  @override
  State<MobileProgrammingSection> createState() =>
      _MobileProgrammingSectionState();
}

class _MobileProgrammingSectionState extends State<MobileProgrammingSection> {
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
                textAlign: TextAlign.center,
                style: Appstyles.primary.copyWith(fontSize: 35.sp),
              ),
              SizedBox(width: 8.w),
              SvgPicture.asset(
                AppAssets.code,
                width: 40.w,
                height: 40.h,
                color: Appcolors.text,
              ),
            ],
          ),
          duration: Duration(milliseconds: 750),
        ),

        SizedBox(height: 40.h),
        ScrollAnimation(
          childW: MobileProgrammingILangs(),
          duration: Duration(milliseconds: 750),
        ),
      ],
    );
  }
}
