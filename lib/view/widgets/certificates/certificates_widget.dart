import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/controller/firestore_controller/firestore_controller.dart';
import 'package:my_portfolio/core/di/di.dart';
import 'package:my_portfolio/models/certificates.dart';
import 'package:my_portfolio/view/widgets/certificates/certificate_item.dart';

class CertificatesWidget extends StatefulWidget {
  const CertificatesWidget({super.key});

  @override
  State<CertificatesWidget> createState() => _CertificatesWidgetState();
}

class _CertificatesWidgetState extends State<CertificatesWidget> {
  final CarouselSliderController _controller = CarouselSliderController();
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
        return Stack(
          children: [
            CarouselSlider(
              carouselController: _controller,
              options: CarouselOptions(
                height: height * .4,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                autoPlayInterval: Duration(seconds: 4),
              ),
              items: certificates.map((x) {
                return CertificateItem(image: x.image!);
              }).toList(),
            ),
            Positioned(
              top: 200.0,
              left: 50,
              child: Center(
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 30.sp,
                    color: Colors.white,
                  ),
                  onPressed: () => _controller.previousPage(),
                ),
              ),
            ),
            Positioned(
              top: 200.0,
              right: 50,
              child: Center(
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 30.sp,
                    color: Colors.white,
                  ),
                  onPressed: () => _controller.nextPage(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
