import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/core/appassets/appassets.dart';
import 'package:my_portfolio/core/appcolors/appcolors.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/about_me/mobile_description.dart';
import 'package:my_portfolio/view/widgets/about_me/description_widget.dart';
import 'package:my_portfolio/view/widgets/scroll_animation.dart';

class MobileAboutMeSection extends StatefulWidget {
  const MobileAboutMeSection({super.key});

  @override
  State<MobileAboutMeSection> createState() => _MobileAboutMeSectionState();
}

class _MobileAboutMeSectionState extends State<MobileAboutMeSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScrollAnimation(
          childW: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectableText(
                "About Me",
                style: Appstyles.primary.copyWith(fontSize: 35.sp),
              ),
              SizedBox(width: 16.w),
              SvgPicture.asset(
                AppAssets.info,
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
          childW: Wrap(children: [MobileDescription()]),
          duration: Duration(milliseconds: 750),
        ),
      ],
    );
  }
}
