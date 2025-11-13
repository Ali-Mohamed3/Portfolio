import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/core/appcolors/appcolors.dart';

class Appstyles {
  static TextStyle primary = GoogleFonts.manrope(
    fontSize: 50.sp,
    fontWeight: FontWeight.bold,
    color: Appcolors.text,
  );
  static TextStyle secondary = GoogleFonts.manrope(
    fontSize: 35.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static TextStyle textfield = GoogleFonts.manrope(
    fontSize: 20.sp,
    fontWeight: FontWeight.bold,
    color: Color(0xff86A3A6),
  );
}
