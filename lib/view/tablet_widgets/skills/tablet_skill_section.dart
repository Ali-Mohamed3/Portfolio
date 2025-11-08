import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/core/appassets/appassets.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/skills/mobile_skill.dart';
import 'package:my_portfolio/view/tablet_widgets/skills/tablet_skill.dart';
import 'package:my_portfolio/view/widgets/scroll_animation.dart';
import 'package:my_portfolio/view/widgets/skills/skill_widget.dart';

class TabletSkillSection extends StatefulWidget {
  const TabletSkillSection({super.key});

  @override
  State<TabletSkillSection> createState() => _TabletSkillSectionState();
}

class _TabletSkillSectionState extends State<TabletSkillSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScrollAnimation(
          childW: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectableText(
                "Skills",
                style: Appstyles.primary.copyWith(fontSize: 30.sp),
              ),
              SizedBox(width: 16.w),
              SvgPicture.asset(
                AppAssets.rocket,
                width: 70.w,
                height: 70.h,
                color: Colors.white,
              ),
            ],
          ),
          duration: Duration(milliseconds: 750),
        ),

        SizedBox(height: 40.h),
        ScrollAnimation(
          childW: TabletSkill(),
          duration: Duration(milliseconds: 750),
        ),
      ],
    );
  }
}
