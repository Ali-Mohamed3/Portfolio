import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/controller/firestore_controller/firestore_controller.dart';
import 'package:my_portfolio/models/certificates.dart';
import 'package:my_portfolio/view/widgets/certificates/certificate_item.dart';

class CertificatesWidget extends StatefulWidget {
  const CertificatesWidget({super.key});

  @override
  State<CertificatesWidget> createState() => _CertificatesWidgetState();
}

class _CertificatesWidgetState extends State<CertificatesWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirestoreController().getCertificates(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(color: Colors.white);
        }
        if (snapshot.hasError) {
          return Text("Error occured");
        }
        List<Certificates> certificates = snapshot.data!;
        return CarouselSlider(
          options: CarouselOptions(
            height: 400.0,
            viewportFraction: 1,
            enableInfiniteScroll: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 4),
          ),
          items: certificates.map((x) {
            return CertificateItem(image: x.image!);
          }).toList(),
        );
      },
    );
  }
}
