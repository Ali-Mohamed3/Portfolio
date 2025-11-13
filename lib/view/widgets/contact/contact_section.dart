import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/core/appassets/appassets.dart';
import 'package:my_portfolio/core/appcolors/appcolors.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/view/widgets/contact/contact_widget.dart';
import 'package:my_portfolio/view/widgets/scroll_animation.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScrollAnimation(
          childW: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectableText("Contact me", style: Appstyles.primary),
              SizedBox(width: 16.w),
              SvgPicture.asset(
                AppAssets.contact,
                width: 50.w,
                height: 50.h,
                color: Appcolors.text,
              ),
            ],
          ),
          duration: Duration(milliseconds: 750),
        ),
        SizedBox(height: 40.h),
        ScrollAnimation(
          childW: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(AppAssets.robot, width: 600.w, height: 600.h),
              Column(
                children: [
                  ContactWidget(),
                  SizedBox(height: 80.h),
                ],
              ),
            ],
          ),
          duration: Duration(milliseconds: 750),
        ),
      ],
    );
  }
}
