import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/controller/firestore_controller/firestore_controller.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/core/di/di.dart';

class MobileGetInfo extends StatefulWidget {
  const MobileGetInfo({super.key});

  @override
  State<MobileGetInfo> createState() => _MobileGetInfoState();
}

class _MobileGetInfoState extends State<MobileGetInfo> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: sl<FirestoreController>().getInfo(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(color: Colors.white);
        }
        if (snapshot.hasError) {
          return Text("An error occured");
        }
        return Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 500.w,
            child: Text(
              snapshot.data!.info.toString(),
              style: Appstyles.secondary.copyWith(fontSize: 25.sp),
            ),
          ),
        );
      },
    );
  }
}
