import 'package:bookvir/widgets/carousel_display/page1_carousel.dart';
import 'package:bookvir/widgets/carousel_display/page2_carousel.dart';
import 'package:bookvir/widgets/carousel_display/page_others.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  final CarouselModel _model = CarouselModel();

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      CarouselPage1Content(),
      CarouselPage2Content(),
    ];
    List<Widget> additionalPages = CarouselPageOthersContent().getPages();
    items.addAll(additionalPages);
    return Container(
      width: double.infinity,
      height: 270,
      child: CarouselSlider(
        items: items,
        // items: const [
        //   CarouselPage1Content(), // This is for "about" section. It will be static and unique, moreover, it will be needed to edit it so it is a seperated carousel.
        //   CarouselPage2Content(), // This is for "age", "height" and "weight" sections. Just like the previous one, a unique structure is needed here so I prefered to seperate this section too.
        //   CarouselPageOthersContent(), // This is for categories and sub-stats. It will be dynamic.
        // ],
        carouselController: _model.carouselController ??=
            CarouselSliderController(),
        options: CarouselOptions(
          initialPage: 0,
          viewportFraction: 0.92,
          disableCenter: true,
          enlargeCenterPage: true,
          enlargeFactor: 0.16,
          enableInfiniteScroll: true,
          scrollDirection: Axis.horizontal,
          autoPlay: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayInterval: const Duration(milliseconds: (800 + 8000)),
          autoPlayCurve: Curves.linear,
          pauseAutoPlayInFiniteScroll: true,
          onPageChanged: (index, _) {
            setState(() {
              _model.carouselCurrentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

class CarouselModel {
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 0;
}
