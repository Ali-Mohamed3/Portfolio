import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_portfolio/controller/firestore_controller/firestore_controller.dart';
import 'package:my_portfolio/core/di/di.dart';
import 'package:my_portfolio/models/projects.dart';
import 'package:my_portfolio/view/widgets/projects/details_screen.dart';
import 'package:my_portfolio/view/widgets/projects/project_item.dart';

class ProjectsWidget extends StatefulWidget {
  const ProjectsWidget({super.key});

  @override
  State<ProjectsWidget> createState() => _ProjectsWidgetState();
}

class _ProjectsWidgetState extends State<ProjectsWidget> {
  bool showDetails = false;
  final CarouselSliderController _controller = CarouselSliderController();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: sl<FirestoreController>().getProjects(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(color: Colors.white);
        }
        if (snapshot.hasError) {
          return SelectableText("Error Occured");
        }
        List<Projects> projects = snapshot.data!;
        return Stack(
          children: [
            CarouselSlider(
              carouselController: _controller,
              options: CarouselOptions(
                height: 400.0,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                autoPlayInterval: Duration(seconds: 10),
              ),
              items: projects.map((x) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          details: x.details!,
                          image: x.image1!,
                          image2: x.image2!,
                          image3: x.image3!,
                          name: x.name!,
                          repo: x.repo!,
                        ),
                      ),
                    );
                  },
                  child: ProjectItem(
                    image: x.image1!,
                    image2: x.image2!,
                    image3: x.image3!,
                    name: x.name!,
                  ),
                );
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
