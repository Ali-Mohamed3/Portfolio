import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/core/appassets/appassets.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/view/widgets/scroll_animation.dart';
import 'package:url_launcher/url_launcher.dart';

class MobileBottomSection extends StatefulWidget {
  const MobileBottomSection({super.key});

  @override
  State<MobileBottomSection> createState() => _MobileBottomSectionState();
}

class _MobileBottomSectionState extends State<MobileBottomSection> {
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
                width: 30.w,
                height: 30.h,
              ),

              SizedBox(width: 5.w),
              SelectableText(
                "2025",
                style: Appstyles.secondary.copyWith(
                  color: Color(0xff247D87),
                  fontSize: 30.sp,
                ),
              ),
              SizedBox(width: 5.w),
              SelectableText(
                "Made by",
                style: Appstyles.primary.copyWith(fontSize: 30.sp),
              ),
              SizedBox(width: 5.w),
              InkWell(
                onTap: () async {
                  final Uri url = Uri.parse(
                    "https://www.linkedin.com/in/ali-mohamed-2299b4326/",
                  );
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  }
                },
                child: Text(
                  "Ali Mohamed Ali",
                  style: Appstyles.primary.copyWith(
                    color: Color(0xff9573D9),
                    fontSize: 30.sp,
                  ),
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
