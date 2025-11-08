import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/controller/firestore_controller/firestore_controller.dart';
import 'package:my_portfolio/core/di/di.dart';
import 'package:my_portfolio/models/projects.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/projects/details_screen.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/projects/mobile_project_item.dart';
import 'package:my_portfolio/view/tablet_widgets/projects/tablet_details_screen.dart';
import 'package:my_portfolio/view/tablet_widgets/projects/tablet_project_item.dart';
import 'package:my_portfolio/view/widgets/projects/project_item.dart';

class TabletProjectsWidgets extends StatefulWidget {
  const TabletProjectsWidgets({super.key});

  @override
  State<TabletProjectsWidgets> createState() => _TabletProjectsWidgetsState();
}

class _TabletProjectsWidgetsState extends State<TabletProjectsWidgets> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: sl<FirestoreController>().getProjects(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(color: Colors.white);
        }
        if (snapshot.hasError) {
          return SelectableText("Error Occured");
        }
        List<Projects> projects = snapshot.data!;
        return CarouselSlider(
          options: CarouselOptions(
            height: 700.0.h,
            viewportFraction: 1,
            enableInfiniteScroll: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 10),
          ),
          items: projects.map((x) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TabletDetailsScreen(
                      details: x.details!,
                      image: x.image1!,
                      image2: x.image2!,
                      image3: x.image3!,
                      name: x.name!,
                      repo: x.repo!,
                    ),
                  ),
                );
              },
              child: TabletProjectItem(
                image: x.image1!,
                image2: x.image2!,
                image3: x.image3!,
                name: x.name!,
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
