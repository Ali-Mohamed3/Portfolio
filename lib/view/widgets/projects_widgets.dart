import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/controller/firestore_controller/firestore_controller.dart';
import 'package:my_portfolio/models/projects.dart';
import 'package:my_portfolio/view/widgets/skill_item.dart';

class ProjectsWidgets extends StatefulWidget {
  const ProjectsWidgets({super.key});

  @override
  State<ProjectsWidgets> createState() => _ProjectsWidgetsState();
}

class _ProjectsWidgetsState extends State<ProjectsWidgets> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreController().getProjects(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(color: Colors.white);
        }
        if (snapshot.hasError) {
          return Text("Error occured");
        }
        List<Projects> projects = snapshot.data!;
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20.h,
            crossAxisSpacing: 20.w,
            childAspectRatio: 10,
          ),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: projects.length,
          itemBuilder: (context, index) {
            return SkillItem(skill: projects[index].name!);
          },
        );
      },
    );
  }
}
