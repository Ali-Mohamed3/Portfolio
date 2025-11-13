import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/core/appassets/appassets.dart';
import 'package:my_portfolio/core/appcolors/appcolors.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/skills/mobile_skill.dart';
import 'package:my_portfolio/view/widgets/scroll_animation.dart';
import 'package:my_portfolio/view/widgets/skills/skill_widget.dart';

class MobileSkillSection extends StatefulWidget {
  const MobileSkillSection({super.key});

  @override
  State<MobileSkillSection> createState() => _MobileSkillSectionState();
}

class _MobileSkillSectionState extends State<MobileSkillSection> {
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
                style: Appstyles.primary.copyWith(fontSize: 35.sp),
              ),
              SizedBox(width: 8.w),
              SvgPicture.asset(
                AppAssets.rocket,
                width: 40.w,
                height: 40.h,
                color: Appcolors.text,
              ),
            ],
          ),
          duration: Duration(milliseconds: 750),
        ),

        SizedBox(height: 40.h),
        ScrollAnimation(
          childW: MobileSkill(),
          duration: Duration(milliseconds: 750),
        ),
      ],
    );
  }
}
