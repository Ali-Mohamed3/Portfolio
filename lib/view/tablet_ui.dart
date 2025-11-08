import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';

import 'package:my_portfolio/view/tablet_widgets/about_me/tablet_about_me_section.dart';
import 'package:my_portfolio/view/tablet_widgets/bottom_section/tablet_bottom_section.dart';
import 'package:my_portfolio/view/tablet_widgets/certificates/tablet_certificates_section.dart';
import 'package:my_portfolio/view/tablet_widgets/contact/tablet_contact_section.dart';
import 'package:my_portfolio/view/tablet_widgets/education/tablet_education_section.dart';
import 'package:my_portfolio/view/tablet_widgets/programming_languages/tablet_programming_section.dart';
import 'package:my_portfolio/view/tablet_widgets/projects/tablet_projects_section.dart';
import 'package:my_portfolio/view/tablet_widgets/skills/tablet_skill_section.dart';
import 'package:my_portfolio/view/tablet_widgets/tools/tablet_tools_section.dart';
import 'package:my_portfolio/view/tablet_widgets/top_section/tablet_top_section.dart';
import 'package:my_portfolio/view/widgets/scroll_animation.dart';

class TabletUi extends StatefulWidget {
  const TabletUi({super.key});

  @override
  State<TabletUi> createState() => _TabletUiState();
}

class _TabletUiState extends State<TabletUi> {
  @override
  final ScrollController _scrollController = ScrollController();

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
      backgroundColor: Color(0xff041112),
      appBar: AppBar(
        backgroundColor: Color(0xff041112),
        actions: [
          TextButton(
            onPressed: () {
              _scrollController.animateTo(
                0,
                duration: const Duration(milliseconds: 1500),
                curve: Curves.easeOut,
              );
            },
            child: Text(
              "Home",
              style: Appstyles.primary.copyWith(fontSize: 25.sp),
            ),
          ),
          TextButton(
            onPressed: () => scrollToSection(aboutKey),
            child: Text(
              "About",
              style: Appstyles.primary.copyWith(fontSize: 25.sp),
            ),
          ),
          TextButton(
            onPressed: () => scrollToSection(projectsKey),
            child: Text(
              "Projects",
              style: Appstyles.primary.copyWith(fontSize: 25.sp),
            ),
          ),
          TextButton(
            onPressed: () => scrollToSection(contactKey),
            child: Text(
              "Contact",
              style: Appstyles.primary.copyWith(fontSize: 25.sp),
            ),
          ),
        ],
      ),
      body: ListView(
        controller: _scrollController,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 70.sp, vertical: 50.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TabletTopSection(),
                  SizedBox(height: 200.h),
                  TabletAboutMeSection(),
                  SizedBox(height: 200.h),
                  TabletEducationSection(),
                  SizedBox(height: 200.h),
                  TabletSkillSection(),
                  SizedBox(height: 200.h),
                  TabletProgrammingSection(),
                  SizedBox(height: 200.h),
                  TabletToolsSection(),
                  SizedBox(height: 200.h),
                  TabletProjectsSection(),
                  SizedBox(height: 200.h),
                  TabletCertificatesSection(),
                  SizedBox(height: 200.h),
                  TabletContactSection(),
                  SizedBox(height: 200.h),
                  ScrollAnimation(
                    childW: Divider(),
                    duration: Duration(milliseconds: 750),
                  ),
                  SizedBox(height: 40.h),
                  TabletBottomSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
