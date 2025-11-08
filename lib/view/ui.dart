import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/core/widgets/cursor_animation.dart';
import 'package:my_portfolio/view/widgets/about_me/about_me_section.dart';
import 'package:my_portfolio/view/widgets/bottom_section/bottom_section.dart';
import 'package:my_portfolio/view/widgets/certificates/certificates_section.dart';
import 'package:my_portfolio/view/widgets/contact/contact_section.dart';
import 'package:my_portfolio/view/widgets/education/education_section.dart';
import 'package:my_portfolio/view/widgets/programming_languages/programming_section.dart';
import 'package:my_portfolio/view/widgets/projects/projects_section.dart';
import 'package:my_portfolio/view/widgets/scroll_animation.dart';
import 'package:my_portfolio/view/widgets/skills/skills_section.dart';
import 'package:my_portfolio/view/widgets/tools/tools_section.dart';

import 'package:my_portfolio/view/widgets/top_section/top_section.dart';

class Ui extends StatefulWidget {
  const Ui({super.key});

  State<Ui> createState() => _UiState();
}

class _UiState extends State<Ui> {
  final ScrollController _scrollController = ScrollController();

  final homeKey = GlobalKey();
  final aboutKey = GlobalKey();
  final projectsKey = GlobalKey();
  final contactKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
  }

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
        title: Text(
          "Ali Mohamed Ali",
          style: Appstyles.primary.copyWith(
            color: Colors.redAccent,
            fontSize: 40.sp,
          ),
        ),
        backgroundColor: Color(0xff041112),
        actionsPadding: EdgeInsets.only(left: 100.w),
        actions: [
          CursorAnimation(
            childW: TextButton(
              onPressed: () {
                _scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 1500),
                  curve: Curves.easeOut,
                );
              },
              child: Text(
                "Home",
                style: Appstyles.primary.copyWith(fontSize: 30.sp),
              ),
            ),
          ),
          CursorAnimation(
            childW: TextButton(
              onPressed: () => scrollToSection(aboutKey),
              child: Text(
                "About",
                style: Appstyles.primary.copyWith(fontSize: 30.sp),
              ),
            ),
          ),
          CursorAnimation(
            childW: TextButton(
              onPressed: () => scrollToSection(projectsKey),
              child: Text(
                "Projects",
                style: Appstyles.primary.copyWith(fontSize: 30.sp),
              ),
            ),
          ),
          CursorAnimation(
            childW: TextButton(
              onPressed: () => scrollToSection(contactKey),
              child: Text(
                "Contact",
                style: Appstyles.primary.copyWith(fontSize: 30.sp),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xff041112),
      body: ListView(
        controller: _scrollController,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 200.sp, vertical: 20.sp),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: TopSection(),
                ),
                SizedBox(height: 132.h),
                Container(key: aboutKey, child: AboutMeSection()),
                SizedBox(height: 150.h),
                EducationSection(),

                SizedBox(height: 150.h),
                SkillsSection(),
                SizedBox(height: 300.h),
                ProgrammingSection(),
                SizedBox(height: 150.h),
                ToolsSection(),
                SizedBox(height: 150.h),
                Container(key: projectsKey, child: ProjectsSection()),
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
