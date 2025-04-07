import 'package:clothingstore/features/presentation/logic/indicators/carousel_indicator_cubit.dart';
import 'package:clothingstore/features/presentation/logic/indicators/women_minimal_styel_dot_indicator.dart';
import 'package:clothingstore/features/presentation/logic/indicators/women_new_arrivels_dot_indicator.dart';
import 'package:clothingstore/features/presentation/pages/home/single_products_screen/single_products_screen.dart';

import 'package:clothingstore/features/presentation/widgets/carousel_slider.dart';
import 'package:clothingstore/features/presentation/widgets/discountbanner.dart';
import 'package:clothingstore/features/presentation/widgets/dot_indicator.dart';
import 'package:clothingstore/features/presentation/widgets/grid_view_list.dart';
import 'package:clothingstore/features/presentation/widgets/listviewProductCard.dart';
import 'package:clothingstore/features/presentation/widgets/section_heading.dart';
import 'package:clothingstore/features/presentation/widgets/sharp_dressing_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WomenTabScreen extends StatelessWidget {
  const WomenTabScreen({
    super.key,
    required this.newArrivelsSrollController,
    required this.minimalStyleSrollController,
  });
  final ScrollController newArrivelsSrollController;
  final ScrollController minimalStyleSrollController;
  @override
  Widget build(BuildContext context) {
    List<String> categorys = [
      "OVERSIZED T-SHIRT",
      "SHIRTS",
      "SNEAKERS",
      "ALL BOTTOMS",
      "TOPS",
      "DRESSES",
      "JACKETS",
      "ACCESSORIES",
    ];
    int maxCount = 5;
    int totalCount = 10;
    int previousIndex = 0;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //* Discount banner
        DiscountBanner(screenWidth: screenWidth, screenHeight: screenHeight),

        SizedBox(height: screenHeight * 0.002),

        //* Carousel slider section
        CarouselSliderSection(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
        ),

        //* dot indicator
        BlocBuilder<CarouselIndicatorCubit, int>(
          builder: (context, state) {
            return DotIndicator(position: state.toDouble());
          },
        ),

        SizedBox(height: screenHeight * 0.02),

        //*  New Arrivels section
        SectionHeading(screenHeight: screenHeight, sectionName: "NEW ARRIVELS"),

        //*list view products card
        ListviewProductsCard(
          products: [],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SingleProductsScreen()),
            );
          },
          screenHeight: screenHeight,
          totalCount: totalCount,
          scrollController: newArrivelsSrollController,
          screenWidth: screenWidth,
        ),

        //* products index dot indicator
        BlocBuilder<WomenNewArrivelsDotIndicator, int>(
          builder: (context, state) {
            if (state > maxCount - 1 && maxCount < totalCount) {
              maxCount++;
            } else if (state < previousIndex && maxCount > 5) {
              maxCount--;
            }
            previousIndex = state;
            return DotIndicator(position: state.toDouble(), dotCount: maxCount);
          },
        ),
        SizedBox(height: screenHeight * 0.02),

        //* categorys section
        SectionHeading(screenHeight: screenHeight, sectionName: "CATEGORYS"),

        //* grid view card
        GridViewCard(

          isNotCategory: true,
          screenHeight: screenHeight,

          screenWidth: screenWidth,
        ),

        SizedBox(height: screenHeight * 0.02),
        //* top picks section
        SectionHeading(screenHeight: screenHeight, sectionName: "TOP PICKS"),

        //* top picks listview
        ListviewProductsCard(
          products: [],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SingleProductsScreen()),
            );
          },
          screenHeight: screenHeight,
          totalCount: totalCount,

          screenWidth: screenWidth,
        ),

        SizedBox(height: screenHeight * 0.02),

        //* minimal style section
        SectionHeading(
          screenHeight: screenHeight,
          sectionName: "MINIMAL PRINTS",
        ),

        //* minimal style
        GridViewCard(
          scrollController: minimalStyleSrollController,
          screenHeight: screenHeight,

          screenWidth: screenWidth,
        ),
        BlocBuilder<WomenMinimalStyelDotIndicator, int>(
          builder: (context, state) {
            if (state > maxCount - 1 && maxCount < 3) {
              maxCount++;
            } else if (state < previousIndex && maxCount > 5) {
              maxCount--;
            }

            previousIndex = state;
            return DotIndicator(position: state.toDouble(), dotCount: 3);
          },
        ),
        SizedBox(height: screenHeight * 0.02),
        //* top picks section
        SectionHeading(screenHeight: screenHeight, sectionName: "BOTTOMS"),

        //* top picks listview
        ListviewProductsCard(
          products: [],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SingleProductsScreen()),
            );
          },
          screenHeight: screenHeight,
          totalCount: totalCount,

          screenWidth: screenWidth,
        ),

        SizedBox(height: screenHeight * 0.02),
        SizedBox(height: screenHeight * 0.02),
        //* sharp dressing section
        SectionHeading(
          screenHeight: screenHeight,
          sectionName: "SHARP DRESSING",
        ),
        SharpDressingListview(
          screenHeight: screenHeight,
          totalCount: totalCount,

          screenWidth: screenWidth,
        ),
        SizedBox(height: screenHeight * 0.02),
      ],
    );
  }
}
