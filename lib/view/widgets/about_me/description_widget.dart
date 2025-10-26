import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/controller/firestore_controller/firestore_controller.dart';
import 'package:my_portfolio/core/appcolors/appcolors.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';

class DescriptionWidget extends StatefulWidget {
  const DescriptionWidget({super.key});

  @override
  State<DescriptionWidget> createState() => _DescriptionWidgetState();
}

class _DescriptionWidgetState extends State<DescriptionWidget> {
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
        stream: FirestoreController().getDescription(),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(color: Colors.white);
          }
          if (snapshot.hasError) {
            return Text("Error occured");
          }
          return Text(
            snapshot.data!.name!,
            style: Appstyles.secondary.copyWith(fontSize: 25.sp),
          );
        },
      ),
    );
  }
}
