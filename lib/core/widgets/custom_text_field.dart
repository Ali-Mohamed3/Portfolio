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
  final bool? isPassword;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const CustomTextField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.width,
    this.isPassword,
    this.controller,
    this.validator,
    this.height,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextFormField(
        maxLines: 10,
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        validator: validator,
        autofocus: false,
        obscureText: isPassword ?? false,
        style: Appstyles.secondary.copyWith(
          color: Colors.white,
          fontSize: 22.sp,
        ),
        decoration: InputDecoration(
          hintText: hintText ?? "",
          hintStyle: TextStyle(
            fontSize: 15.sp,
            color: Color(0xff8391A1),
            fontWeight: FontWeight.w400,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Color(0xffE8ECF4), width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.white, width: 1),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.white, width: 1),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
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
