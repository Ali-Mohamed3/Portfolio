import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/core/appassets/appassets.dart';
import 'package:my_portfolio/core/appcolors/appcolors.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/certificates/mobile_certificates_widget.dart';
import 'package:my_portfolio/view/widgets/certificates/certificates_widget.dart';
import 'package:my_portfolio/view/widgets/scroll_animation.dart';

class MobileCertificatesSection extends StatefulWidget {
  const MobileCertificatesSection({super.key});

  @override
  State<MobileCertificatesSection> createState() =>
      _MobileCertificatesSectionState();
}

class _MobileCertificatesSectionState extends State<MobileCertificatesSection> {
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
              SizedBox(width: 8.w),
              SvgPicture.asset(
                AppAssets.certificates,
                width: 40.w,
                height: 40.h,
                color: Appcolors.text,
              ),
            ],
          ),
          duration: Duration(milliseconds: 750),
        ),
        SizedBox(height: 40.h),
        ScrollAnimation(
          childW: MobileCertificatesWidget(),
          duration: Duration(milliseconds: 750),
        ),
      ],
    );
  }
}
