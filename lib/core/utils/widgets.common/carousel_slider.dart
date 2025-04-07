import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarouselSliderSection extends StatelessWidget {
  const CarouselSliderSection({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: screenHeight * 0.6,
        autoPlay: true,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
      
        },
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(seconds: 1),
        autoPlayCurve: Curves.fastOutSlowIn,
        viewportFraction: 1,
      ),
      items: [
        Container(
          width: screenWidth,
          // margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(color: Colors.orange),
          child: Image.network("banner.image", fit: BoxFit.cover),
        ),
        Container(
          width: screenWidth,
          // margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(color: Colors.orange),
          child: Image.network("banner.image", fit: BoxFit.cover),
        ),
        Container(
          width: screenWidth,
          // margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(color: Colors.orange),
          child: Image.network("banner.image", fit: BoxFit.cover),
        ),
        Container(
          width: screenWidth,
          // margin: const EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(color: Colors.orange),
          child: Image.network("banner.image", fit: BoxFit.cover),
        ),
      ],
    );
  }
}
