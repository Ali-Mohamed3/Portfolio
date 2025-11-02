import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/controller/firestore_controller/firestore_controller.dart';
import 'package:my_portfolio/core/di/di.dart';
import 'package:my_portfolio/models/tools_apps.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/tools/mobile_tools_item.dart';
import 'package:my_portfolio/view/widgets/tools/tools_item.dart';

class MobileToolsWidget extends StatefulWidget {
  const MobileToolsWidget({super.key});

  @override
  State<MobileToolsWidget> createState() => _MobileToolsWidgetState();
}

class _MobileToolsWidgetState extends State<MobileToolsWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: sl<FirestoreController>().getTools(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(color: Colors.white);
        }
        if (snapshot.hasError) {
          return Text("Error occured");
        }
        List<ToolsApps> tools = snapshot.data!;
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: tools.length,
          itemBuilder: (context, index) {
            return MobileToolsItem(tool: tools[index].name!);
          },
        );
      },
    );
  }
}
