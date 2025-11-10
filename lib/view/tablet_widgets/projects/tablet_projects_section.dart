import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/core/widgets/custom_button.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/projects/mobile_projects_widget.dart';
import 'package:my_portfolio/view/tablet_widgets/projects/tablet_projects_widget.dart';
import 'package:my_portfolio/view/widgets/projects/projects_widget.dart';
import 'package:my_portfolio/view/widgets/scroll_animation.dart';

class TabletProjectsSection extends StatefulWidget {
  const TabletProjectsSection({super.key});

  @override
  State<TabletProjectsSection> createState() => _TabletProjectsSectionState();
}

class _TabletProjectsSectionState extends State<TabletProjectsSection> {
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
                style: Appstyles.primary.copyWith(fontSize: 35.sp),
              ),
            ],
          ),
          duration: Duration(milliseconds: 750),
        ),
        SizedBox(height: 100.h),
        ScrollAnimation(
          childW: TabletProjectsWidgets(),
          duration: Duration(milliseconds: 750),
        ),
      ],
    );
  }
}
