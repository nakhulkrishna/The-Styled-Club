import 'package:clothingstore/common/bloc/carosel_cubit/carousel_cubit.dart';
import 'package:clothingstore/core/router/go_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Bloc
import 'package:clothingstore/common/bloc/scroll_cubit/scroll_cubit.dart';

// Common Widgets
import 'package:clothingstore/common/widgets/discountbanner.dart';
import 'package:clothingstore/common/widgets/dot_indicator.dart';
import 'package:clothingstore/features/home/presentation/widgets/section_heading.dart';

// Men Tab Widgets
import 'package:clothingstore/features/home/presentation/pages/men_tab_screen/widgets/men_new_arrivel_list.dart';
import 'package:clothingstore/features/home/presentation/pages/men_tab_screen/widgets/men_categorys_grid_list.dart';
import 'package:clothingstore/features/home/presentation/pages/men_tab_screen/widgets/men_top_picks_list.dart';
import 'package:clothingstore/features/home/presentation/pages/men_tab_screen/widgets/men_minimal_style_categorie_list.dart';
import 'package:clothingstore/features/home/presentation/pages/men_tab_screen/widgets/men_sharp_dressing_list.dart';
import 'package:clothingstore/features/home/presentation/pages/men_tab_screen/widgets/man_banner_carousel_slider.dart';

import 'package:go_router/go_router.dart';

class MenTabScreen extends StatelessWidget {
  const MenTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    const int totalCount = 6;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔻 Discount Banner
          DiscountBanner(screenWidth: screenWidth, screenHeight: screenHeight),

          // 🔻 Carousel Slider with Dot Indicator
          BlocProvider(
            create: (_) => CarouselCubit(),
            child: Column(
              children: [
                ManBannerCarouselSlider(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                ),
                BlocBuilder<CarouselCubit, int>(
                  builder: (_, state) {
                    return DotIndicator(
                      position: state.toDouble(),
                      dotCount: 6,
                    );
                  },
                ),
              ],
            ),
          ),

          SizedBox(height: screenHeight * 0.02),

          // 🔻 Section: New Arrivals
          SectionHeading(
            screenHeight: screenHeight,
            sectionName: "NEW ARRIVALS",
          ),
          BlocProvider(
            create: (_) => ScrollIndexCubit(),
            child: Column(
              children: [
                MenNewArrivelList(
                  onTap:
                      (product) =>
                          context.go("/singleProducts", extra: product),
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  totalCount: totalCount,
                ),
                BlocBuilder<ScrollIndexCubit, int>(
                  builder: (_, state) {
                    return DotIndicator(
                      position: state.toDouble(),
                      dotCount: 6,
                    );
                  },
                ),
              ],
            ),
          ),

          SizedBox(height: screenHeight * 0.02),

          // 🔻 Section: Categories
          SectionHeading(screenHeight: screenHeight, sectionName: "CATEGORIES"),
          MenCategorysGridList(
            isNotCategory: true,
            screenHeight: screenHeight,
            screenWidth: screenWidth,
          ),

          SizedBox(height: screenHeight * 0.02),

          // 🔻 Section: Top Picks
          SectionHeading(screenHeight: screenHeight, sectionName: "TOP PICKS"),
          BlocProvider(
            create: (_) => ScrollIndexCubit(),
            child: Column(
              children: [
                MenTopPicksList(
                  onTap:
                      (prodcut) =>
                          context.go("/singleProducts", extra: prodcut),
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  totalCount: totalCount,
                ),
                BlocBuilder<ScrollIndexCubit, int>(
                  builder: (_, state) {
                    return DotIndicator(
                      position: state.toDouble(),
                      dotCount: 5,
                    );
                  },
                ),
              ],
            ),
          ),

          SizedBox(height: screenHeight * 0.02),

          // 🔻 Section: Minimal Styles
          SectionHeading(
            screenHeight: screenHeight,
            sectionName: "MINIMAL STYLES",
          ),
          BlocProvider(
            create: (_) => ScrollIndexCubit(),
            child: Column(
              children: [
                MenMinimalStyleCategorieList(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                ),
                BlocBuilder<ScrollIndexCubit, int>(
                  builder: (_, state) {
                    return DotIndicator(
                      position: state.toDouble(),
                      dotCount: 6,
                    );
                  },
                ),
              ],
            ),
          ),

          SizedBox(height: screenHeight * 0.02),

          // 🔻 Section: Sharp Dressing
          SectionHeading(
            screenHeight: screenHeight,
            sectionName: "SHARP DRESSING",
          ),
          BlocProvider(
            create: (_) => ScrollIndexCubit(),
            child: Column(
              children: [
                MenSharpDressingList(
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                  totalCount: totalCount,
                ),
                BlocBuilder<ScrollIndexCubit, int>(
                  builder: (_, state) {
                    return DotIndicator(
                      position: state.toDouble(),
                      dotCount: 6,
                    );
                  },
                ),
              ],
            ),
          ),

          SizedBox(height: screenHeight * 0.03),
        ],
      ),
    );
  }
}
