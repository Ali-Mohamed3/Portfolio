import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/tools/mobile_tools_widget.dart';
import 'package:my_portfolio/view/tablet_widgets/tools/tablet_tools_widget.dart';
import 'package:my_portfolio/view/widgets/scroll_animation.dart';
import 'package:my_portfolio/view/widgets/tools/tools_widget.dart';

class TabletToolsSection extends StatefulWidget {
  const TabletToolsSection({super.key});

  @override
  State<TabletToolsSection> createState() => _TabletToolsSectionState();
}

class _TabletToolsSectionState extends State<TabletToolsSection> {
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
                style: Appstyles.primary.copyWith(fontSize: 30.sp),
              ),
            ],
          ),
          duration: Duration(milliseconds: 750),
        ),

        SizedBox(height: 40.h),
        ScrollAnimation(
          childW: TabletToolsWidget(),
          duration: Duration(milliseconds: 750),
        ),
      ],
    );
  }
}
