import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/certificates/mobile_certificates_widget.dart';
import 'package:my_portfolio/view/tablet_widgets/certificates/tablet_certificates_widget.dart';
import 'package:my_portfolio/view/widgets/certificates/certificates_widget.dart';
import 'package:my_portfolio/view/widgets/scroll_animation.dart';

class TabletCertificatesSection extends StatefulWidget {
  const TabletCertificatesSection({super.key});

  @override
  State<TabletCertificatesSection> createState() =>
      _TabletCertificatesSectionState();
}

class _TabletCertificatesSectionState extends State<TabletCertificatesSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ScrollAnimation(
          childW: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectableText(
                "Certificates",
                style: Appstyles.primary.copyWith(fontSize: 30.sp),
              ),
            ],
          ),
          duration: Duration(milliseconds: 750),
        ),
        SizedBox(height: 40.h),
        ScrollAnimation(
          childW: TabletCertificatesWidget(),
          duration: Duration(milliseconds: 750),
        ),
      ],
    );
  }
}
