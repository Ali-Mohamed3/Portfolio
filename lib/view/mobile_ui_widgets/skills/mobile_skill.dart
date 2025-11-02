import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:my_portfolio/controller/firestore_controller/firestore_controller.dart';
import 'package:my_portfolio/core/di/di.dart';
import 'package:my_portfolio/models/skills.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/skills/mobile_skill_item.dart';
import 'package:my_portfolio/view/widgets/skills/skill_item.dart';

class MobileSkill extends StatefulWidget {
  const MobileSkill({super.key});

  @override
  State<MobileSkill> createState() => _MobileSkillState();
}

class _MobileSkillState extends State<MobileSkill> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: sl<FirestoreController>().getSkills(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(color: Colors.white);
        }
        if (snapshot.hasError) {
          return Text("Error occured");
        }
        List<Skills> skills = snapshot.data!;
        return ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 50.h),
          itemCount: skills.length,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return MobileSkillItem(skill: skills[index].name!);
          },
        );
      },
    );
  }
}
