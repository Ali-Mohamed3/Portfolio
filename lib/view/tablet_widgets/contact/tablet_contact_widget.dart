import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_portfolio/controller/firestore_controller/firestore_controller.dart';
import 'package:my_portfolio/core/appcolors/appcolors.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/core/di/di.dart';
import 'package:my_portfolio/core/widgets/custom_button.dart';
import 'package:my_portfolio/core/widgets/custom_text_field.dart';

class TabletContactWidget extends StatefulWidget {
  const TabletContactWidget({super.key});

  @override
  State<TabletContactWidget> createState() => _TabletContactWidgetState();
}

class _TabletContactWidgetState extends State<TabletContactWidget> {
  late TextEditingController email;

  late TextEditingController message;
  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    message = TextEditingController();
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(20.0.sp),
        child: Column(
          children: [
            Container(
              width: width * .9,
              height: 750,
              padding: EdgeInsets.all(15.sp),
              decoration: BoxDecoration(
                color: Appcolors.secondary,
                borderRadius: BorderRadius.circular(40.r),
                border: Border.all(color: Colors.white),
              ),
              child: Column(
                children: [
                  CustomTextField(
                    hintText: "Enter your email",
                    width: 600.w,
                    height: 100.h,
                    fontSize: 25.sp,
                    hintTextSized: 21.sp,
                    controller: email,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return "Enter your email please";
                      }
                    },
                  ),
                  SizedBox(height: 30.h),
                  Expanded(
                    child: CustomTextField(
                      hintText: "Enter your message",
                      fontSize: 25.sp,
                      width: 600.w,
                      height: 800.h,
                      hintTextSized: 21.sp,
                      controller: message,
                      validator: (p0) {
                        if (p0!.isEmpty) {
                          return "Enter your message please";
                        }
                      },
                      maxLines: 20,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  CustomButton(
                    height: 100.h,
                    width: 300.w,
                    text: "Send",
                    radius: 50,
                    ontap: () {
                      if (formKey.currentState!.validate()) {
                        if (isValid(email.text)) {
                          showCustomDialogue(
                            context,
                            "Thanks for contacting me",
                            Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 60.sp,
                            ),
                          );
                          Map<String, dynamic> data = {
                            'email': email.text,
                            'message': message.text,
                          };
                          sl<FirestoreController>().db
                              .collection('contact')
                              .add(data);
                        } else {
                          showCustomDialogue(
                            context,
                            "Email is invalid",
                            Icon(Icons.error, color: Colors.red, size: 60.sp),
                          );
                        }
                        email.clear();
                        message.clear();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

bool isValid(String email) {
  final regex = RegExp(r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$');
  return regex.hasMatch(email);
}

void showCustomDialogue(BuildContext context1, String text, Icon icon) {
  showDialog(
    context: context1,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Container(
          width: 500.w,
          height: 350,
          decoration: BoxDecoration(
            color: Color(0xff041112),
            borderRadius: BorderRadius.circular(20.r),
            border: Border.all(color: Colors.white),
          ),
          padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * .02),
          child: Column(
            children: [
              icon,
              SizedBox(height: 50.h),
              SelectableText(
                text,
                style: Appstyles.secondary.copyWith(fontSize: 30.sp),
              ),
              SizedBox(height: 170.h),
              CustomButton(
                height: 80.h,
                width: 200.w,
                radius: 50,
                text: "Ok",
                ontap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
