import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/controller/firestore_controller/firestore_controller.dart';
import 'package:my_portfolio/models/projects.dart';
import 'package:my_portfolio/view/widgets/projects/project_item.dart';

class ProjectsWidget extends StatefulWidget {
  const ProjectsWidget({super.key});

  @override
  State<ProjectsWidget> createState() => _ProjectsWidgetState();
}

class _ProjectsWidgetState extends State<ProjectsWidget> {
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
            height: 400.0,
            viewportFraction: 1,
            enableInfiniteScroll: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 4),
          ),
          items: projects.map((x) {
            return ProjectItem(
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
