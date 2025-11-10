import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/controller/firestore_controller/firestore_controller.dart';
import 'package:my_portfolio/core/appcolors/appcolors.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/core/di/di.dart';

class MobileEducation extends StatefulWidget {
  const MobileEducation({super.key});

  @override
  State<MobileEducation> createState() => _MobileEducationState();
}

class _MobileEducationState extends State<MobileEducation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.sp),

      decoration: BoxDecoration(
        color: Appcolors.secondary,
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(width: 1.w, color: Colors.white),
      ),
      child: StreamBuilder(
        stream: sl<FirestoreController>().getEducation(),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(color: Colors.white);
          }
          if (snapshot.hasError) {
            return SelectableText("Error occured");
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SelectableText(
                snapshot.data!.university,
                style: Appstyles.secondary.copyWith(fontSize: 25.sp),
              ),
              SizedBox(height: 10.h),
              SelectableText(
                snapshot.data!.faculty,
                style: Appstyles.secondary.copyWith(fontSize: 25.sp),
              ),
              SizedBox(height: 10.h),
              SelectableText(
                snapshot.data!.speciality,
                style: Appstyles.secondary.copyWith(fontSize: 25.sp),
              ),
              SizedBox(height: 10.h),
            ],
          );
        },
      ),
    );
  }
}
