import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/controller/firestore_controller/firestore_controller.dart';
import 'package:my_portfolio/core/appcolors/appcolors.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';

class EducationWidget extends StatefulWidget {
  const EducationWidget({super.key});

  @override
  State<EducationWidget> createState() => _EducationWidgetState();
}

class _EducationWidgetState extends State<EducationWidget> {
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
        stream: FirestoreController().getEducation(),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(color: Colors.white);
          }
          if (snapshot.hasError) {
            return Text("Error occured");
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                snapshot.data!.university,
                style: Appstyles.secondary.copyWith(fontSize: 25.sp),
              ),
              SizedBox(height: 10.h),
              Text(
                snapshot.data!.faculty,
                style: Appstyles.secondary.copyWith(fontSize: 25.sp),
              ),
              SizedBox(height: 10.h),
              Text(
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
