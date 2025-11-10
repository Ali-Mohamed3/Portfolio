import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/core/appassets/appassets.dart';
import 'package:url_launcher/url_launcher.dart';

class TabletIconsWidget extends StatefulWidget {
  const TabletIconsWidget({super.key});

  @override
  State<TabletIconsWidget> createState() => _IconsState();
}

class _IconsState extends State<TabletIconsWidget> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () async {
            final Uri url = Uri.parse(
              "https://www.linkedin.com/in/ali-mohamed-2299b4326/",
            );
            if (await canLaunchUrl(url)) {
              await launchUrl(url, mode: LaunchMode.externalApplication);
            } else {
              throw "couldn't launch url";
            }
          },
          child: SvgPicture.asset(
            AppAssets.linkedIn,
            width: 65.w,
            height: 65.h,
          ),
        ),
        SizedBox(width: width * .02),
        InkWell(
          onTap: () async {
            final Uri url = Uri.parse("https://github.com/Ali-Mohamed3");
            if (await canLaunchUrl(url)) {
              await launchUrl(url, mode: LaunchMode.externalApplication);
            } else {
              throw "couldn't launch url";
            }
          },
          child: SvgPicture.asset(
            AppAssets.gitHub,
            width: 65.w,
            height: 65.h,
            color: Color(0xff25F0FB),
          ),
        ),
        SizedBox(width: width * .02),

        InkWell(
          onTap: () async {
            final Uri url = Uri.parse("https://wa.me/201551515998");
            if (await canLaunchUrl(url)) {
              await launchUrl(url, mode: LaunchMode.externalApplication);
            } else {
              throw "couldn't launch url";
            }
          },
          child: SvgPicture.asset(
            AppAssets.whatsApp,
            width: 65.w,
            height: 65.h,
          ),
        ),
        SizedBox(width: width * .02),
        InkWell(
          onTap: () async {
            final Uri url = Uri.parse("https://codeforces.com/profile/_ALI__");
            if (await canLaunchUrl(url)) {
              await launchUrl(url, mode: LaunchMode.externalApplication);
            } else {
              throw "couldn't launch url";
            }
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(AppAssets.codeForces, width: 40.w, height: 60.h),
          ),
        ),
        SizedBox(width: width * .02),
        InkWell(
          onTap: () async {
            final Uri url = Uri.parse("https://leetcode.com/u/_Ali_Mo_/");
            if (await canLaunchUrl(url)) {
              await launchUrl(url, mode: LaunchMode.externalApplication);
            } else {
              throw "couldn't launch url";
            }
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(AppAssets.leetCode, width: 40.w, height: 60.h),
          ),
        ),
      ],
    );
  }
}
