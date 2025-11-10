import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/appcolors/appcolors.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';

class CustomTextField extends StatelessWidget {
  final String? hintText;
  final Widget? suffixIcon;
  final double? width;
  final double? height;
  final double? hintTextSized;
  final bool? isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final double? fontSize;
  final int? maxLines;
  const CustomTextField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.width,
    this.isPassword,
    this.controller,
    this.validator,
    this.height,
    this.hintTextSized,
    this.fontSize,
    this.maxLines,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        maxLines: maxLines ?? 1,
        textAlignVertical: maxLines == 1
            ? TextAlignVertical.center
            : TextAlignVertical.top,
        controller: controller,
        validator: validator,
        autofocus: false,
        obscureText: isPassword ?? false,
        style: Appstyles.secondary.copyWith(
          color: Colors.white,
          fontSize: fontSize ?? 22.sp,
        ),
        decoration: InputDecoration(
          hintText: hintText ?? "",
          hintStyle: TextStyle(
            fontSize: hintTextSized ?? 15.sp,
            color: Color(0xff8391A1),
            fontWeight: FontWeight.w400,
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: maxLines == 1 ? 0 : 20.h,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: Color(0xffE8ECF4), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: Colors.white, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: Colors.white, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide(color: Colors.white, width: 1),
          ),
          filled: true,
          fillColor: Appcolors.secondary,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
