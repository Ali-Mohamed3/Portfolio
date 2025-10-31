import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/controller/firestore_controller/firestore_controller.dart';
import 'package:my_portfolio/models/projects.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/projects/mobile_project_item.dart';
import 'package:my_portfolio/view/widgets/projects/project_item.dart';

class MobileProjectsWidgets extends StatefulWidget {
  const MobileProjectsWidgets({super.key});

  @override
  State<MobileProjectsWidgets> createState() => _MobileProjectsWidgetsState();
}

class _MobileProjectsWidgetsState extends State<MobileProjectsWidgets> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreController().getProjects(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(color: Colors.white);
        }
        if (snapshot.hasError) {
          return Text("Error Occured");
        }
        List<Projects> projects = snapshot.data!;
        return CarouselSlider(
          options: CarouselOptions(
            height: 505.0.h,
            viewportFraction: 1,
            enableInfiniteScroll: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 10),
          ),
          items: projects.map((x) {
            return MobileProjectItem(
              image: x.image1!,
              image2: x.image2!,
              image3: x.image3!,
              name: x.name!,
            );
          }).toList(),
        );
      },
    );
  }
}
