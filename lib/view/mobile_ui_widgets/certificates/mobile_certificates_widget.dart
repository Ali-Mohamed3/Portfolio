import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/controller/firestore_controller/firestore_controller.dart';
import 'package:my_portfolio/core/di/di.dart';
import 'package:my_portfolio/models/certificates.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/certificates/mobile_certificate_item.dart';
import 'package:my_portfolio/view/widgets/certificates/certificate_item.dart';

class MobileCertificatesWidget extends StatefulWidget {
  const MobileCertificatesWidget({super.key});

  @override
  State<MobileCertificatesWidget> createState() =>
      _MobileCertificatesWidgetState();
}

class _MobileCertificatesWidgetState extends State<MobileCertificatesWidget> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return StreamBuilder(
      stream: sl<FirestoreController>().getCertificates(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(color: Colors.white);
        }
        if (snapshot.hasError) {
          return SelectableText("Error occured");
        }
        List<Certificates> certificates = snapshot.data!;
        return CarouselSlider(
          options: CarouselOptions(
            height: height * .3,
            viewportFraction: 1,
            enableInfiniteScroll: false,
          ),
          items: certificates.map((x) {
            return MobileCertificateItem(image: x.image!);
          }).toList(),
        );
      },
    );
  }
}
