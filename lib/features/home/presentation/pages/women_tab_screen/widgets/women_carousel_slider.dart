import 'package:carousel_slider/carousel_slider.dart';
import 'package:clothingstore/common/bloc/carosel_cubit/carousel_cubit.dart';
import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/features/home/presentation/bloc/banner/banner_cubit.dart';
import 'package:clothingstore/features/home/presentation/bloc/banner/banner_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WomenCarouselSlider extends StatelessWidget {
  const WomenCarouselSlider({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WomenBannerCubit, WomenBannerState>(
      builder: (context, state) {
        if (state is WomenBannerLoading) {
          return CarouselSlider(
            options: CarouselOptions(
              height: screenHeight * 0.6,
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                context.read<CarouselCubit>().changePage(index);
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
                color: GColors.lightContainers,
              ),
              Container(
                width: screenWidth,
                // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                color: GColors.lightContainers,
              ),
              Container(
                width: screenWidth,
                // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                color: GColors.lightContainers,
              ),
              Container(
                width: screenWidth,
                // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                color: GColors.lightContainers,
              ),
            ],
          );
        } else if (state is WomenBannerLoaded) {
          final banner = state.banners;
          return CarouselSlider(
            options: CarouselOptions(
              height: screenHeight * 0.6,
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                context.read<CarouselCubit>().changePage(index);
              },
              autoPlayInterval: const Duration(seconds: 5),
              autoPlayAnimationDuration: const Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              viewportFraction: 1,
            ),
            items:
                banner.map((banner) {
                  return Builder(
                    builder: (context) {
                      return Container(
                        width: screenWidth,
                        // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        color: GColors.lightContainers,
                        child: Image.network(
                          banner.image,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: Icon(Icons.image_not_supported),
                            );
                          },
                        ),
                      );
                    },
                  );
                }).toList(),
          );
        } else if (state is WomenBannerError) {
          return CarouselSlider(
            options: CarouselOptions(
              height: screenHeight * 0.6,
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                context.read<CarouselCubit>().changePage(index);
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
                color: GColors.lightContainers,
              ),
              Container(
                width: screenWidth,
                // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                color: GColors.lightContainers,
              ),
              Container(
                width: screenWidth,
                // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                color: GColors.lightContainers,
              ),
              Container(
                width: screenWidth,
                // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                color: GColors.lightContainers,
              ),
            ],
          );
        } else {
          return CarouselSlider(
            options: CarouselOptions(
              height: screenHeight * 0.6,
              autoPlay: true,
              enlargeCenterPage: true,
              onPageChanged: (index, reason) {
                context.read<CarouselCubit>().changePage(index);
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
                color: GColors.lightContainers,
              ),
              Container(
                width: screenWidth,
                // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                color: GColors.lightContainers,
              ),
              Container(
                width: screenWidth,
                // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                color: GColors.lightContainers,
              ),
              Container(
                width: screenWidth,
                // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                color: GColors.lightContainers,
              ),
            ],
          );
        }
      },
    );
  }
}
