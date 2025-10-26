import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/controller/firestore_controller/firestore_controller.dart';
import 'package:my_portfolio/view/widgets/skill_item.dart';
import 'package:my_portfolio/models/programming_langs.dart' as model;

class ProgrammingLangs extends StatefulWidget {
  const ProgrammingLangs({super.key});

  @override
  State<ProgrammingLangs> createState() => _ProgrammingLangsState();
}

class _ProgrammingLangsState extends State<ProgrammingLangs> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreController().getLangs(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(color: Colors.white);
        }
        if (snapshot.hasError) {
          return Text("Error occured");
        }
        List<model.ProgrammingLangs> languages = snapshot.data!;
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20.h,
            crossAxisSpacing: 20.w,
            childAspectRatio: 10,
          ),
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: languages.length,
          itemBuilder: (context, index) {
            return SkillItem(skill: languages[index].name!);
          },
        );
      },
    );
  }
}
