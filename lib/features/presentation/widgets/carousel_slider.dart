import 'package:carousel_slider/carousel_slider.dart';
import 'package:clothingstore/features/presentation/logic/banner/banner_bloc.dart';
import 'package:clothingstore/features/presentation/logic/banner/banner_event.dart';
import 'package:clothingstore/features/presentation/logic/banner/banner_state.dart';
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
    context.read<BannerBloc>().add(FetchBanners());
    return BlocBuilder<CarouselIndicatorCubit, int>(
      builder: (context, carouselState) {
        return BlocBuilder<BannerBloc, BannerState>(
          builder: (context, bannerState) {
            if (bannerState is BannerLoading) {
              return SizedBox.shrink();
            } else if (bannerState is BannerError) {
              return Center(child: Text("Error: ${bannerState.message}"));
            } else if (bannerState is BannerLoaded) {
              return CarouselSlider(
                options: CarouselOptions(
                  height: screenHeight * 0.6,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    context.read<CarouselIndicatorCubit>().changePageIndex(
                      index,
                    );
                  },
                  autoPlayInterval: const Duration(seconds: 5),
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  viewportFraction: 1,
                ),
                items:
                    bannerState.banners.map((banner) {
                      return Container(
                        width: screenWidth,
                        // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(color: Colors.orange),
                        child: Image.network(banner.image, fit: BoxFit.cover),
                      );
                    }).toList(),
              );
            }
            return Center(child: Text("No banners available"));
          },
        );
      },
    );
  }
}
