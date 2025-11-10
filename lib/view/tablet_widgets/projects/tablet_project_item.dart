import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/core/appcolors/appcolors.dart';
import 'package:my_portfolio/core/appstyles/appstyles.dart';

class TabletProjectItem extends StatelessWidget {
  final String name;
  final String image;
  final String image2;
  final String image3;
  const TabletProjectItem({
    super.key,
    required this.image,
    required this.name,
    required this.image2,
    required this.image3,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      alignment: Alignment.center,
      width: width * .55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(width: 1.sp, color: Colors.white),
        color: Appcolors.secondary,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: image,
                  height: height * .3,
                  width: width * .182,
                  fit: BoxFit.fill,
                ),
                CachedNetworkImage(
                  imageUrl: image2,
                  height: height * .3,
                  width: width * .182,
                  fit: BoxFit.fill,
                ),
                CachedNetworkImage(
                  imageUrl: image3,
                  height: height * .3,
                  width: width * .182,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Center(
            child: Text(
              name,
              style: Appstyles.primary.copyWith(fontSize: 30.sp),
            ),
          ),
        ],
      ),
    );
  }
}
