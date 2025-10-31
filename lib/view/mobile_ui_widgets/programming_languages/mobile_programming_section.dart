import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/programming_languages/mobile_programming_langs.dart';
import 'package:my_portfolio/view/widgets/programming_languages/programming_langs.dart';
import 'package:my_portfolio/view/widgets/scroll_animation.dart';

class MobileProgrammingSection extends StatefulWidget {
  const MobileProgrammingSection({super.key});

  @override
  State<MobileProgrammingSection> createState() =>
      _MobileProgrammingSectionState();
}

class _MobileProgrammingSectionState extends State<MobileProgrammingSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScrollAnimation(
          childW: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("Programming languages", style: Appstyles.primary)],
          ),
          duration: Duration(milliseconds: 750),
        ),

        SizedBox(height: 40.h),
        ScrollAnimation(
          childW: MobileProgrammingILangs(),
          duration: Duration(milliseconds: 750),
        ),
      ],
    );
  }
}
