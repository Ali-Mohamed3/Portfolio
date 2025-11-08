import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/core/widgets/custom_button.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/projects/mobile_projects_widget.dart';
import 'package:my_portfolio/view/widgets/projects/projects_widget.dart';
import 'package:my_portfolio/view/widgets/scroll_animation.dart';

class MobileProjectsSection extends StatefulWidget {
  const MobileProjectsSection({super.key});

  @override
  State<MobileProjectsSection> createState() => _MobileProjectsSectionState();
}

class _MobileProjectsSectionState extends State<MobileProjectsSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScrollAnimation(
          childW: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectableText(
                "Projects",
                style: Appstyles.primary.copyWith(fontSize: 30.sp),
              ),
            ],
          ),
          duration: Duration(milliseconds: 750),
        ),
        SizedBox(height: 40.h),
        ScrollAnimation(
          childW: MobileProjectsWidgets(),
          duration: Duration(milliseconds: 750),
        ),
      ],
    );
  }
}
