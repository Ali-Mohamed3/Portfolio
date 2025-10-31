import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/core/appassets/appassets.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/contact/mobile_contact_widget.dart';
import 'package:my_portfolio/view/widgets/contact/contact_widget.dart';
import 'package:my_portfolio/view/widgets/scroll_animation.dart';

class MobileContactSection extends StatefulWidget {
  const MobileContactSection({super.key});

  @override
  State<MobileContactSection> createState() => _MobileContactSectionState();
}

class _MobileContactSectionState extends State<MobileContactSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScrollAnimation(
          childW: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Contact me", style: Appstyles.primary)],
          ),
          duration: Duration(milliseconds: 750),
        ),
        SizedBox(height: 40.h),
        ScrollAnimation(
          childW: Column(
            children: [
              MobileContactWidget(),
              SizedBox(height: 80.h),
            ],
          ),
          duration: Duration(milliseconds: 750),
        ),
      ],
    );
  }
}
