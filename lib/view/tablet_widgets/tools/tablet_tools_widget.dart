import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/controller/firestore_controller/firestore_controller.dart';
import 'package:my_portfolio/core/di/di.dart';
import 'package:my_portfolio/models/tools_apps.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/tools/mobile_tools_item.dart';
import 'package:my_portfolio/view/tablet_widgets/tools/tablet_tools_item.dart';
import 'package:my_portfolio/view/widgets/tools/tools_item.dart';

class TabletToolsWidget extends StatefulWidget {
  const TabletToolsWidget({super.key});

  @override
  State<TabletToolsWidget> createState() => _TabletToolsWidgetState();
}

class _TabletToolsWidgetState extends State<TabletToolsWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: sl<FirestoreController>().getTools(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(color: Colors.white);
        }
        if (snapshot.hasError) {
          return SelectableText("Error occured");
        }
        List<ToolsApps> tools = snapshot.data!;
        return ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: tools.length,
          itemBuilder: (context, index) {
            return TabletToolsItem(tool: tools[index].name!);
          },
        );
      },
    );
  }
}
