import 'package:flutter/material.dart';
import 'package:my_portfolio/core/appcolors/appcolors.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';

class MobileUi extends StatefulWidget {
  const MobileUi({super.key});

  @override
  State<MobileUi> createState() => _MobileUiState();
}

class _MobileUiState extends State<MobileUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff041112),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "The mobile version of the portfolio will be available soon :)",
              style: Appstyles.primary,
            ),
          ),
        ],
      ),
    );
  }
}
