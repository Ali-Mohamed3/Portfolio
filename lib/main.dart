import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/di/di.dart';
import 'package:my_portfolio/view/UI.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_portfolio/view/mobile_ui.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 1080) {
            return ScreenUtilInit(
              designSize: const Size(1920, 1080),
              minTextAdapt: true,
              builder: (context, child) => Ui(),
            );
          } else {
            return ScreenUtilInit(
              designSize: const Size(700, 1400),
              minTextAdapt: true,
              builder: (context, child) => MobileUi(),
            );
          }
        },
      ),
    );
  }
}
