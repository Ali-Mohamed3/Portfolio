import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:my_portfolio/controller/firestore_controller/firestore_controller.dart';
import 'package:my_portfolio/core/di/di.dart';
import 'package:my_portfolio/models/skills.dart';
import 'package:my_portfolio/view/widgets/skills/skill_item.dart';

class SkillWidget extends StatefulWidget {
  const SkillWidget({super.key});

  @override
  State<SkillWidget> createState() => _SkillWidgetState();
}

class _SkillWidgetState extends State<SkillWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: sl<FirestoreController>().getSkills(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(color: Colors.white);
        }
        if (snapshot.hasError) {
          return SelectableText("Error occured");
        }
        List<Skills> skills = snapshot.data!;
        return AnimationLimiter(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 29.w,
              mainAxisSpacing: 200.h,
              childAspectRatio: 10,
            ),
            itemCount: skills.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return AnimationConfiguration.staggeredGrid(
                position: index,
                columnCount: 4,
                duration: const Duration(milliseconds: 500),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: SkillItem(skill: skills[index].name!),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
