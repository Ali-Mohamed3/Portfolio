import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/view/widgets/scroll_animation.dart';
import 'package:my_portfolio/view/widgets/tools_widget.dart';

class ToolsSection extends StatefulWidget {
  const ToolsSection({super.key});

  @override
  State<ToolsSection> createState() => _ToolsSectionState();
}

class _ToolsSectionState extends State<ToolsSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScrollAnimation(
          childW: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Tools", style: Appstyles.primary)],
          ),
          duration: Duration(milliseconds: 750),
        ),

        SizedBox(height: 40.h),
        ScrollAnimation(
          childW: ToolsWidget(),
          duration: Duration(milliseconds: 750),
        ),
      ],
    );
  }
}
