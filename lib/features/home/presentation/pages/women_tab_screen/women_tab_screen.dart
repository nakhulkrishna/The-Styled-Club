import 'package:clothingstore/common/bloc/carosel_cubit/carousel_cubit.dart';
import 'package:clothingstore/common/widgets/carousel_slider.dart';
import 'package:clothingstore/common/widgets/discountbanner.dart';
import 'package:clothingstore/common/widgets/dot_indicator.dart';
import 'package:clothingstore/features/home/presentation/pages/women_tab_screen/widgets/women_bottom_list.dart';
import 'package:clothingstore/features/home/presentation/pages/women_tab_screen/widgets/women_carousel_slider.dart';
import 'package:clothingstore/features/home/presentation/pages/women_tab_screen/widgets/women_categorys_grid_list.dart';
import 'package:clothingstore/features/home/presentation/pages/women_tab_screen/widgets/women_minimal_style_categorie_list.dart';
import 'package:clothingstore/features/home/presentation/pages/women_tab_screen/widgets/women_new_arrivel_list.dart';
import 'package:clothingstore/features/home/presentation/pages/women_tab_screen/widgets/women_sharp_dressing_list.dart';
import 'package:clothingstore/features/home/presentation/pages/women_tab_screen/widgets/women_top_picks_list.dart';
import 'package:clothingstore/features/home/presentation/widgets/section_heading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WomenTabScreen extends StatelessWidget {
  const WomenTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int maxCount = 5;
    int totalCount = 10;

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DiscountBanner(screenWidth: screenWidth, screenHeight: screenHeight),
        SizedBox(height: screenHeight * 0.002),

        BlocProvider(
          create: (_) => CarouselCubit(),
          child: Column(
            children: [
              WomenCarouselSlider(
                screenHeight: screenHeight,
                screenWidth: screenWidth,
              ),
              BlocBuilder<CarouselCubit, int>(
                builder: (_, state) {
                  return DotIndicator(position: state.toDouble(), dotCount: 6);
                },
              ),
            ],
          ),
        ),

        SizedBox(height: screenHeight * 0.02),
        SectionHeading(screenHeight: screenHeight, sectionName: "NEW ARRIVELS"),

        WomenNewArrivelList(
          onTap: (product) => context.go("/singleProducts", extra: product),
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          totalCount: totalCount,
        ),

        DotIndicator(position: 1, dotCount: maxCount),
        SizedBox(height: screenHeight * 0.02),
        SectionHeading(screenHeight: screenHeight, sectionName: "CATEGORYS"),

        WomenCategorysGridList(
          isNotCategory: true,
          screenHeight: screenHeight,
          screenWidth: screenWidth,
        ),

        SizedBox(height: screenHeight * 0.02),
        SectionHeading(screenHeight: screenHeight, sectionName: "TOP PICKS"),

        WomenTopPicksList(
          onTap: (product) => context.go("/singleProducts", extra: product),
          screenHeight: screenHeight,
          screenWidth: screenWidth,
        ),

        SizedBox(height: screenHeight * 0.02),
        SectionHeading(
          screenHeight: screenHeight,
          sectionName: "MINIMAL PRINTS",
        ),

        WomenMinimalStyleCategorieList(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
        ),

        DotIndicator(position: 1, dotCount: 3),
        SizedBox(height: screenHeight * 0.02),
        SectionHeading(screenHeight: screenHeight, sectionName: "BOTTOMS"),

        WomenBottomList(
          onTap: (product) => context.go("/singleProducts", extra: product),
          screenHeight: screenHeight,
          screenWidth: screenWidth,
        ),

        SizedBox(height: screenHeight * 0.04),
        SectionHeading(
          screenHeight: screenHeight,
          sectionName: "SHARP DRESSING",
        ),

        WomenSharpDressingList(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          totalCount: totalCount,
        ),

        SizedBox(height: screenHeight * 0.02),
      ],
    );
  }
}
