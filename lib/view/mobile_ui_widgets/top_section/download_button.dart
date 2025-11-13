import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/appcolors/appcolors.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';

import 'package:url_launcher/url_launcher.dart';

class DownloadButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String? text;
  final double? radius;
  final void Function()? ontap;
  final String? url;
  final String? fileName;
  const DownloadButton({
    super.key,
    this.height,
    this.width,
    this.text,
    this.radius,
    this.ontap,
    this.fileName,
    this.url,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width ?? 270.w, height ?? 52.h),
        backgroundColor: Appcolors.buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 20.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 5.h),
        side: BorderSide(width: 1.sp, color: Appcolors.text),
      ),

      onPressed: () async {
        final Uri url = Uri.parse(
          "https://drive.google.com/drive/folders/15UUruEzRgGJKAXHvEto0yFdKuRNv1h4z?usp=drive_link",
        );
        if (await canLaunchUrl(url)) {
          await launchUrl(url, mode: LaunchMode.externalApplication);
        } else {
          throw "couldn't launch url";
        }
      },
      child: Text(
        text!,
        style: Appstyles.primary.copyWith(fontSize: 25.sp, color: Colors.white),
      ),
    );
  }
}
