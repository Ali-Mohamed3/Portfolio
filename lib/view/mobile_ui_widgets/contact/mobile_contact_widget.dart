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

class MobileContactWidget extends StatefulWidget {
  const MobileContactWidget({super.key});

  @override
  State<MobileContactWidget> createState() => _MobileContactWidgetState();
}

class _MobileContactWidgetState extends State<MobileContactWidget> {
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
        padding: EdgeInsets.all(50.0.sp),
        child: Column(
          children: [
            Container(
              width: width * .85,
              height: 380,
              padding: EdgeInsets.all(15.sp),
              decoration: BoxDecoration(
                color: Appcolors.secondary,
                borderRadius: BorderRadius.circular(15.r),
                border: Border.all(color: Colors.white),
              ),
              child: Column(
                children: [
                  CustomTextField(
                    fontSize: 25.sp,
                    hintText: "Enter your email",
                    width: 600.w,
                    height: 80.h,
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
                      fontSize: 25.sp,
                      hintText: "Enter your message",
                      width: 600.w,
                      height: 500.h,
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
                  SizedBox(height: 15.h),
                  CustomButton(
                    height: 80.h,
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
        child: Wrap(
          children: [
            Container(
              width: 550.w,
              decoration: BoxDecoration(
                color: Appcolors.primary,
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(color: Appcolors.text),
              ),
              padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * .05),
              child: Column(
                children: [
                  icon,
                  SizedBox(height: 50.h),
                  SelectableText(
                    text,
                    style: Appstyles.secondary.copyWith(fontSize: 30.sp),
                  ),
                  SizedBox(height: 150.h),
                  CustomButton(
                    height: 50.h,
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
          ],
        ),
      );
    },
  );
}
