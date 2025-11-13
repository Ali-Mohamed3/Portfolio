import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/core/appassets/appassets.dart';
import 'package:my_portfolio/core/appcolors/appcolors.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/tools/mobile_tools_widget.dart';
import 'package:my_portfolio/view/widgets/scroll_animation.dart';
import 'package:my_portfolio/view/widgets/tools/tools_widget.dart';

class MobileToolsSection extends StatefulWidget {
  const MobileToolsSection({super.key});

  @override
  State<MobileToolsSection> createState() => _MobileToolsSectionState();
}

class _MobileToolsSectionState extends State<MobileToolsSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScrollAnimation(
          childW: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectableText(
                "Tools",
                style: Appstyles.primary.copyWith(fontSize: 35.sp),
              ),
              SizedBox(width: 8.w),
              SvgPicture.asset(
                AppAssets.tools,
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
          childW: MobileToolsWidget(),
          duration: Duration(milliseconds: 750),
        ),
      ],
    );
  }
}
