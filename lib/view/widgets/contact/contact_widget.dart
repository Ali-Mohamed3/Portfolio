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

class ContactWidget extends StatefulWidget {
  const ContactWidget({super.key});

  @override
  State<ContactWidget> createState() => _ContactWidgetState();
}

class _ContactWidgetState extends State<ContactWidget> {
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
    return Form(
      key: formKey,
      child: Column(
        children: [
          Container(
            width: 600.w,
            height: 600.h,
            padding: EdgeInsets.all(15.sp),
            decoration: BoxDecoration(
              color: Appcolors.secondary,
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(color: Colors.white),
            ),
            child: Column(
              children: [
                CustomTextField(
                  hintText: "Enter your email",
                  width: 500.w,
                  height: 70.h,
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
                    width: 500.w,
                    height: 500,
                    controller: message,
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return "Enter your message please";
                      }
                    },
                  ),
                ),
                CustomButton(
                  height: 80.h,
                  width: 200.w,
                  text: "Send",
                  radius: 50,
                  ontap: () {
                    if (formKey.currentState!.validate()) {
                      Map<String, dynamic> data = {
                        'email': email.text,
                        'message': message.text,
                      };
                      sl<FirestoreController>().db
                          .collection('contact')
                          .add(data)
                          .then((DocumentReference doc) {
                            return print("doc.id");
                          });
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
          height: 500.h,
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
              Text(text, style: Appstyles.secondary.copyWith(fontSize: 30.sp)),
              SizedBox(height: 200.h),
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
      );
    },
  );
}
