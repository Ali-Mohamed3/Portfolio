import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/core/appassets/appassets.dart';
import 'package:my_portfolio/core/appcolors/appcolors.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/contact/mobile_contact_widget.dart';
import 'package:my_portfolio/view/tablet_widgets/contact/tablet_contact_widget.dart';
import 'package:my_portfolio/view/widgets/contact/contact_widget.dart';
import 'package:my_portfolio/view/widgets/scroll_animation.dart';

class TabletContactSection extends StatefulWidget {
  const TabletContactSection({super.key});

  @override
  State<TabletContactSection> createState() => _TabletContactSectionState();
}

class _TabletContactSectionState extends State<TabletContactSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScrollAnimation(
          childW: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectableText(
                "Contact me",
                style: Appstyles.primary.copyWith(fontSize: 35.sp),
              ),
              SizedBox(width: 16.w),
              SvgPicture.asset(
                AppAssets.contact,
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
          childW: Column(
            children: [
              TabletContactWidget(),
              SizedBox(height: 80.h),
            ],
          ),
          duration: Duration(milliseconds: 750),
        ),
      ],
    );
  }
}
