import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/controller/firestore_controller/firestore_controller.dart';
import 'package:my_portfolio/core/di/di.dart';
import 'package:my_portfolio/models/certificates.dart';
import 'package:my_portfolio/view/mobile_ui_widgets/certificates/mobile_certificate_item.dart';
import 'package:my_portfolio/view/tablet_widgets/certificates/tablet_certificate_item.dart';
import 'package:my_portfolio/view/widgets/certificates/certificate_item.dart';

class TabletCertificatesWidget extends StatefulWidget {
  const TabletCertificatesWidget({super.key});

  @override
  State<TabletCertificatesWidget> createState() =>
      _TabletCertificatesWidgetState();
}

class _TabletCertificatesWidgetState extends State<TabletCertificatesWidget> {
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
            height: height * .35,
            viewportFraction: 1,
            enableInfiniteScroll: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 10),
          ),
          items: certificates.map((x) {
            return TabletCertificateItem(image: x.image!);
          }).toList(),
        );
      },
    );
  }
}
