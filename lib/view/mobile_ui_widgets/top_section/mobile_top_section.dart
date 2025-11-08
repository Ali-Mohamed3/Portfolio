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

class MobileTopSection extends StatefulWidget {
  const MobileTopSection({super.key});

  @override
  State<MobileTopSection> createState() => _MobileTopSectionState();
}

class _MobileTopSectionState extends State<MobileTopSection> {
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
            return MobilePhotoWidget(url: image.image);
          },
        ),

        SizedBox(height: 30.h),
        SelectableText("Ali Mohamed Ali", style: Appstyles.primary),
        SizedBox(height: 20.h),
        MobileGetInfo(),
        SizedBox(height: 30.h),
        MobileIconsWidget(),
        SizedBox(height: 40.h),
        DownloadButton(text: "Download my CV", width: 350.w, height: 70.h),
      ],
    );
  }
}
