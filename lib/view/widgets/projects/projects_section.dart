import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/core/appassets/appassets.dart';
import 'package:my_portfolio/core/appcolors/appcolors.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/core/widgets/custom_button.dart';
import 'package:my_portfolio/view/widgets/projects/projects_widget.dart';
import 'package:my_portfolio/view/widgets/scroll_animation.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScrollAnimation(
          childW: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectableText("Projects", style: Appstyles.primary),
              SizedBox(width: 16.w),
              SvgPicture.asset(
                AppAssets.projects,
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
          childW: ProjectsWidget(),
          duration: Duration(milliseconds: 750),
        ),
      ],
    );
  }
}
