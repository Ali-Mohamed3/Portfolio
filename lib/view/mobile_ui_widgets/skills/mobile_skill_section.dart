import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/core/appassets/appassets.dart';
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
              Text("Skills", style: Appstyles.primary),
              SizedBox(width: 16.w),
              SvgPicture.asset(
                AppAssets.rocket,
                width: 50.w,
                height: 50.h,
                color: Colors.white,
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
