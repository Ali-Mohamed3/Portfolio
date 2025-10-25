import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/view/widgets/about_me_section.dart';
import 'package:my_portfolio/view/widgets/bottom_section.dart';
import 'package:my_portfolio/view/widgets/certificates_section.dart';
import 'package:my_portfolio/view/widgets/contact_section.dart';
import 'package:my_portfolio/view/widgets/education_section.dart';
import 'package:my_portfolio/view/widgets/programming_section.dart';
import 'package:my_portfolio/view/widgets/scroll_animation.dart';
import 'package:my_portfolio/view/widgets/skills_section.dart';
import 'package:my_portfolio/view/widgets/tools_section.dart';
import 'package:my_portfolio/view/widgets/top_section.dart';

class Ui extends StatefulWidget {
  const Ui({super.key});

  @override
  State<Ui> createState() => _UiState();
}

class _UiState extends State<Ui> {
  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 1500),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff041112),
        actions: [
          TextButton(
            onPressed: () => scrollToSection(homeKey),
            child: Text(
              "Home",
              style: Appstyles.primary.copyWith(fontSize: 30.sp),
            ),
          ),
          TextButton(
            onPressed: () => scrollToSection(aboutKey),
            child: Text(
              "About",
              style: Appstyles.primary.copyWith(fontSize: 30.sp),
            ),
          ),
          TextButton(
            onPressed: () => scrollToSection(projectsKey),
            child: Text(
              "Projects",
              style: Appstyles.primary.copyWith(fontSize: 30.sp),
            ),
          ),
          TextButton(
            onPressed: () => scrollToSection(contactKey),
            child: Text(
              "Contact",
              style: Appstyles.primary.copyWith(fontSize: 30.sp),
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xff041112),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 200.sp, vertical: 20.sp),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: TopSection(),
                ),
                SizedBox(height: 132.h),
                Container(key: aboutKey, child: AboutMeSection()),
                SizedBox(height: 150.h),
                EducationSection(),
                SizedBox(height: 150.h),
                SizedBox(height: 150.h),
                SkillsSection(),
                SizedBox(height: 150.h),
                ProgrammingSection(),
                SizedBox(height: 150.h),
                ToolsSection(),
                SizedBox(height: 150.h),
                CertificatesSection(),
                SizedBox(height: 150.h),
                Container(key: contactKey, child: ContactSection()),
                SizedBox(height: 150.h),
                ScrollAnimation(
                  childW: Divider(),
                  duration: Duration(milliseconds: 750),
                ),
                SizedBox(height: 40.h),
                BottomSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
