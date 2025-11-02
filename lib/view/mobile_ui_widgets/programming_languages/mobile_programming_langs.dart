import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/controller/firestore_controller/firestore_controller.dart';
import 'package:my_portfolio/core/di/di.dart';
import 'package:my_portfolio/models/programming_langs.dart' as model;
import 'package:my_portfolio/view/mobile_ui_widgets/programming_languages/mobile_programming_item.dart';
import 'package:my_portfolio/view/widgets/programming_languages/programming_item.dart';
import 'package:my_portfolio/view/widgets/programming_languages/programming_langs.dart';
import 'package:my_portfolio/view/widgets/skills/skill_item.dart';

class MobileProgrammingILangs extends StatefulWidget {
  const MobileProgrammingILangs({super.key});

  @override
  State<MobileProgrammingILangs> createState() =>
      _MobileProgrammingILangsState();
}

class _MobileProgrammingILangsState extends State<MobileProgrammingILangs> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: sl<FirestoreController>().getLangs(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(color: Colors.white);
        }
        if (snapshot.hasError) {
          return Text("Error occured");
        }
        List<model.ProgrammingLangs> languages = snapshot.data!;
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: languages.length,
          itemBuilder: (context, index) {
            return MobileProgrammingItem(language: languages[index].name!);
          },
        );
      },
    );
  }
}
