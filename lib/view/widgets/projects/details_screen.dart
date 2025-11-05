import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';
import 'package:my_portfolio/core/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailsScreen extends StatelessWidget {
  final String name;
  final String image;
  final String image2;
  final String image3;
  final String details;
  final String repo;
  const DetailsScreen({
    super.key,
    required this.details,
    required this.image,
    required this.image2,
    required this.image3,
    required this.name,
    required this.repo,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff041112),
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      bottomLeft: Radius.circular(20.r),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      height: 520.h,
                      width: 300.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                  CachedNetworkImage(
                    imageUrl: image2,
                    height: 520.h,
                    width: 300.w,
                    fit: BoxFit.fill,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.r),
                      bottomRight: Radius.circular(20.r),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: image3,
                      height: 520.h,
                      width: 300.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Center(
                child: SelectableText(
                  name,
                  style: Appstyles.primary.copyWith(color: Colors.lightBlue),
                ),
              ),
              SizedBox(height: 30.h),
              SelectableText(
                details,
                style: Appstyles.secondary.copyWith(fontSize: 30.sp),
              ),
              SizedBox(height: 100.h),
              CustomButton(
                text: "Repo",
                width: 300.w,
                height: 60.h,
                ontap: () async {
                  final Uri url = Uri.parse(repo);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  } else {
                    throw "couldn't launch url";
                  }
                },
                radius: 20.r,
                color: Colors.lightBlue,
              ),
              SizedBox(height: 100.h),
            ],
          ),
        ],
      ),
    );
  }
}
