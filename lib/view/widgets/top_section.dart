import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/core/widgets/custom_button.dart';
import 'package:my_portfolio/view/widgets/getInfo.dart';
import 'package:my_portfolio/view/widgets/icons_widget.dart';
import 'package:my_portfolio/view/widgets/photo_widget.dart';

class TopSection extends StatefulWidget {
  const TopSection({super.key});

  @override
  State<TopSection> createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ali Mohamed Ali", style: Appstyles.primary),
            SizedBox(height: 10.h),
            Getinfo(),
            SizedBox(height: 15.h),
            IconsWidget(),
            SizedBox(height: 40.h),
            CustomButton(text: "Download my cv"),
          ],
        ),
        PhotoWidget(),
      ],
    );
  }
}
