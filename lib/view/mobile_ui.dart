import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/appcolors/appcolors.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/about_me/mobile_about_me_section.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/bottom_section/mobile_bottom_section.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/certificates/mobile_certificates_section.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/contact/mobile_contact_section.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/education/mobile_education_section.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/programming_languages/mobile_programming_langs.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/programming_languages/mobile_programming_section.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/projects/mobile_projects_section.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/skills/mobile_skill_section.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/tools/mobile_tools_section.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/top_section/mobile_top_section.dart';
import 'package:my_portfolio/view/widgets/contact/contact_section.dart';
import 'package:my_portfolio/view/widgets/scroll_animation.dart';

class MobileUi extends StatefulWidget {
  const MobileUi({super.key});

  @override
  State<MobileUi> createState() => _MobileUiState();
}

class _MobileUiState extends State<MobileUi> {
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
              padding: EdgeInsets.symmetric(horizontal: 30.sp, vertical: 20.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MobileTopSection(),
                  SizedBox(height: 100.h),
                  Container(key: aboutKey, child: MobileAboutMeSection()),
                  SizedBox(height: 100.h),
                  MobileEducationSection(),
                  SizedBox(height: 100.h),
                  MobileSkillSection(),
                  SizedBox(height: 100.h),
                  MobileProgrammingSection(),
                  SizedBox(height: 100.h),
                  MobileToolsSection(),
                  SizedBox(height: 100.h),
                  Container(key: projectsKey, child: MobileProjectsSection()),
                  SizedBox(height: 100.h),
                  MobileCertificatesSection(),
                  SizedBox(height: 100.h),
                  Container(key: contactKey, child: MobileContactSection()),
                  ScrollAnimation(
                    childW: Divider(),
                    duration: Duration(milliseconds: 750),
                  ),
                  SizedBox(height: 40.h),
                  MobileBottomSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
