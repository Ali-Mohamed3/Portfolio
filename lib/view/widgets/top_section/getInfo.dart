import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/controller/firestore_controller/firestore_controller.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/core/di/di.dart';

class Getinfo extends StatefulWidget {
  const Getinfo({super.key});

  @override
  State<Getinfo> createState() => _GetinfoState();
}

class _GetinfoState extends State<Getinfo> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: sl<FirestoreController>().getInfo(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(color: Colors.white);
        }
        if (snapshot.hasError) {
          return SelectableText("An error occured");
        }
        return SizedBox(
          width: 800.w,
          child: SelectableText(
            snapshot.data!.info.toString(),
            style: Appstyles.secondary.copyWith(fontSize: 22.sp),
          ),
        );
      },
    );
  }
}
