import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/core/appassets/appassets.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/view/widgets/scroll_animation.dart';

class BottomSection extends StatefulWidget {
  const BottomSection({super.key});

  @override
  State<BottomSection> createState() => _BottomSectionState();
}

class _BottomSectionState extends State<BottomSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScrollAnimation(
          childW: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppAssets.copyRight,
                color: Colors.white,
                width: 20.w,
                height: 20.h,
              ),

              SizedBox(width: 5.w),
              Text(
                "2025",
                style: Appstyles.secondary.copyWith(
                  color: Color(0xff247D87),
                  fontSize: 20.sp,
                ),
              ),
              SizedBox(width: 5.w),
              Text(
                "Made by",
                style: Appstyles.primary.copyWith(fontSize: 20.sp),
              ),
              SizedBox(width: 5.w),
              Text(
                "Ali Mohamed Ali",
                style: Appstyles.primary.copyWith(
                  color: Color(0xff9573D9),
                  fontSize: 20.sp,
                ),
              ),
            ],
          ),
          duration: Duration(milliseconds: 750),
        ),
      ],
    );
  }
}
