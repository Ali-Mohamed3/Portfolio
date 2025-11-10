import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/controller/firestore_controller/firestore_controller.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/core/di/di.dart';

class TabletGetInfo extends StatefulWidget {
  const TabletGetInfo({super.key});

  @override
  State<TabletGetInfo> createState() => _TabletGetInfoState();
}

class _TabletGetInfoState extends State<TabletGetInfo> {
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
        return Align(
          alignment: Alignment.center,
          child: SelectableText(
            snapshot.data!.info.toString(),
            textAlign: TextAlign.center,
            style: Appstyles.secondary.copyWith(fontSize: 20.sp),
          ),
        );
      },
    );
  }
}
