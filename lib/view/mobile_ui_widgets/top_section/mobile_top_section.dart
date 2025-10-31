import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/core/widgets/custom_button.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/top_section/getInfo.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/top_section/mobile_icons_widget.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/top_section/mobile_photo_widget.dart';
import 'package:my_portfolio/view/widgets/top_section/getInfo.dart';
import 'package:my_portfolio/view/widgets/top_section/photo_widget.dart';

class MobileTopSection extends StatefulWidget {
  const MobileTopSection({super.key});

  @override
  State<MobileTopSection> createState() => _MobileTopSectionState();
}

class _MobileTopSectionState extends State<MobileTopSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MobilePhotoWidget(),
        SizedBox(height: 20.h),
        Text("Ali Mohamed Ali", style: Appstyles.primary),
        SizedBox(height: 20.h),
        MobileGetInfo(),
        SizedBox(height: 30.h),
        MobileIconsWidget(),
        SizedBox(height: 40.h),
        CustomButton(text: "Download my CV", width: 350.w, height: 70.h),
      ],
    );
  }
}
