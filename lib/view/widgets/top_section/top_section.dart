import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/controller/firestore_controller/firestore_controller.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/core/di/di.dart';
import 'package:my_portfolio/core/widgets/custom_button.dart';
import 'package:my_portfolio/models/cv.dart';
import 'package:my_portfolio/view/widgets/top_section/download_button.dart';
import 'package:my_portfolio/view/widgets/top_section/getInfo.dart';
import 'package:my_portfolio/view/widgets/top_section/icons_widget.dart';
import 'package:my_portfolio/view/widgets/top_section/photo_widget.dart';

class TopSection extends StatefulWidget {
  const TopSection({super.key});

  @override
  State<TopSection> createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ali Mohamed Ali", style: Appstyles.primary),
            SizedBox(height: 10.h),
            Getinfo(),
            SizedBox(height: 15.h),
            IconsWidget(),
            SizedBox(height: 40.h),
            StreamBuilder(
              stream: sl<FirestoreController>().getCv(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(color: Colors.white);
                }
                if (snapshot.hasError) {
                  return Text("Error occurred");
                }
                Cv cv = snapshot.data!;
                return DownloadButton(
                  text: "Download my CV",
                  width: 350.w,
                  url: cv.url,
                  fileName: cv.name,
                );
              },
            ),
          ],
        ),
        PhotoWidget(),
      ],
    );
  }
}
