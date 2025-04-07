import 'package:clothingstore/core/utils/widgets.common/carousel_slider.dart';
import 'package:clothingstore/core/utils/widgets.common/discountbanner.dart';
import 'package:clothingstore/core/utils/widgets.common/dot_indicator.dart';

import 'package:clothingstore/features/home/presentation/pages/women_tab_screen/widgets/women_bottom_list.dart';
import 'package:clothingstore/features/home/presentation/pages/women_tab_screen/widgets/women_categorys_grid_list.dart';
import 'package:clothingstore/features/home/presentation/pages/women_tab_screen/widgets/women_minimal_style_categorie_list.dart';
import 'package:clothingstore/features/home/presentation/pages/women_tab_screen/widgets/women_new_arrivel_list.dart';
import 'package:clothingstore/features/home/presentation/pages/women_tab_screen/widgets/women_sharp_dressing_list.dart';
import 'package:clothingstore/features/home/presentation/pages/women_tab_screen/widgets/women_top_picks_list.dart';
import 'package:clothingstore/features/home/presentation/widgets/section_heading.dart';
import 'package:clothingstore/features/products/presentation/pages/single_product/single_product_view.dart';
import 'package:flutter/material.dart';

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
        //* Discount banner
        DiscountBanner(screenWidth: screenWidth, screenHeight: screenHeight),

        SizedBox(height: screenHeight * 0.002),

        //* Carousel slider section
        CarouselSliderSection(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
        ),

        //* dot indicator
        DotIndicator(position: 1),

        SizedBox(height: screenHeight * 0.02),

        //*  New Arrivels section
        SectionHeading(screenHeight: screenHeight, sectionName: "NEW ARRIVELS"),

        //*list view products card
        WomenNewArrivelList(
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

        //* products index dot indicator
        DotIndicator(position: 1, dotCount: maxCount),
        SizedBox(height: screenHeight * 0.02),

        //* categorys section
        SectionHeading(screenHeight: screenHeight, sectionName: "CATEGORYS"),

        //* grid view card
        WomenCategorysGridList(
          isNotCategory: true,
          screenHeight: screenHeight,

          screenWidth: screenWidth,
        ),

        SizedBox(height: screenHeight * 0.02),
        //* top picks section
        SectionHeading(screenHeight: screenHeight, sectionName: "TOP PICKS"),

        //* top picks listview
        WomenTopPicksList(
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
        WomenMinimalStyleCategorieList(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
        ),
        DotIndicator(position: 1, dotCount: 3),
        SizedBox(height: screenHeight * 0.02),
        //* top picks section
        SectionHeading(screenHeight: screenHeight, sectionName: "BOTTOMS"),

        //* top picks listview
        WomenBottomList(
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
        WomenSharpDressingList(
          screenHeight: screenHeight,
          totalCount: totalCount,

          screenWidth: screenWidth,
        ),
        SizedBox(height: screenHeight * 0.02),
      ],
    );
  }
}
