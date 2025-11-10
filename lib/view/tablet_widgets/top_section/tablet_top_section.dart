import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/controller/firestore_controller/firestore_controller.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/core/di/di.dart';
import 'package:my_portfolio/models/image.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/top_section/download_button.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/top_section/getInfo.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/top_section/mobile_icons_widget.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/top_section/mobile_photo_widget.dart';
import 'package:my_portfolio/view/tablet_widgets/top_section/tablet_getInfo.dart';
import 'package:my_portfolio/view/tablet_widgets/top_section/tablet_icons_widget.dart';
import 'package:my_portfolio/view/tablet_widgets/top_section/tablet_photo_widget.dart';

class TabletTopSection extends StatefulWidget {
  const TabletTopSection({super.key});

  @override
  State<TabletTopSection> createState() => _TabletTopSectionState();
}

class _TabletTopSectionState extends State<TabletTopSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        StreamBuilder(
          stream: sl<FirestoreController>().getProfileImage(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(color: Colors.white);
            }
            if (snapshot.hasError) {
              return SelectableText(
                snapshot.error.toString(),
                style: TextStyle(color: Colors.white),
              );
            }
            ImageModel image = snapshot.data!;
            return TabletPhotoWidget(url: image.image);
          },
        ),

        SizedBox(height: 70.h),
        SelectableText(
          "Ali Mohamed Ali",
          style: Appstyles.primary.copyWith(fontSize: 40.sp),
        ),
        SizedBox(height: 20.h),
        TabletGetInfo(),
        SizedBox(height: 70.h),
        TabletIconsWidget(),
        SizedBox(height: 70.h),
        DownloadButton(text: "Download my CV", width: 300.w, height: 100.h),
      ],
    );
  }
}
