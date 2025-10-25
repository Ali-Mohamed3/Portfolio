import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/appcolors/appcolors.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String? text;
  final double? radius;
  final void Function()? ontap;
  const CustomButton({
    super.key,
    this.height,
    this.width,
    this.text,
    this.radius,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width ?? 215.w, height ?? 52.h),
        backgroundColor: Appcolors.buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 20.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 5.h),
        side: BorderSide(width: 1.sp, color: Colors.white),
      ),

      onPressed: ontap ?? () {},
      child: Text(text!, style: Appstyles.primary.copyWith(fontSize: 19.sp)),
    );
  }
}
