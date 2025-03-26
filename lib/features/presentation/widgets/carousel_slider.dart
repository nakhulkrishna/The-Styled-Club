import 'package:carousel_slider/carousel_slider.dart';
import 'package:clothingstore/features/presentation/logic/indicators/carousel_indicator_cubit.dart';
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
    return BlocBuilder<CarouselIndicatorCubit, int>(
      builder: (context, state) {
        return CarouselSlider(
          options: CarouselOptions(
            height: screenHeight * 0.65, // Set carousel height
            autoPlay: true,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              context.read<CarouselIndicatorCubit>().changePageIndex(index);
            },
            // aspectRatio: 16 / 16,
            autoPlayInterval: const Duration(seconds: 5),
            autoPlayAnimationDuration: const Duration(seconds: 1),
            autoPlayCurve: Curves.fastOutSlowIn,
            pauseAutoPlayOnTouch: true,
            viewportFraction: 1,
          ),
          items: [
            Container(
              width: screenWidth,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(color: Colors.orange),
            ),
            Container(
              width: screenWidth,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(color: Colors.green),
            ),
            Container(
              width: screenWidth,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(color: Colors.red),
            ),
            Container(
              width: screenWidth,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(color: Colors.pink),
            ),
            Container(
              width: screenWidth,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            Container(
              width: screenWidth,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(color: Colors.deepPurpleAccent),
            ),
          ],
        );
      },
    );
  }
}
