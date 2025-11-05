import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/view/widgets/programming_languages/programming_langs.dart';
import 'package:my_portfolio/view/widgets/scroll_animation.dart';

class ProgrammingSection extends StatefulWidget {
  const ProgrammingSection({super.key});

  @override
  State<ProgrammingSection> createState() => _ProgrammingSectionState();
}

class _ProgrammingSectionState extends State<ProgrammingSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScrollAnimation(
          childW: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectableText("Programming languages", style: Appstyles.primary),
            ],
          ),
          duration: Duration(milliseconds: 750),
        ),

        SizedBox(height: 40.h),
        ScrollAnimation(
          childW: ProgrammingLangs(),
          duration: Duration(milliseconds: 750),
        ),
      ],
    );
  }
}
