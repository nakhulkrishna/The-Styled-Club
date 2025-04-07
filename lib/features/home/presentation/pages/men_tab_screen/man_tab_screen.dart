import 'package:flutter/material.dart';


// Common widgets
import 'package:clothingstore/core/utils/widgets.common/carousel_slider.dart';
import 'package:clothingstore/core/utils/widgets.common/discountbanner.dart';
import 'package:clothingstore/core/utils/widgets.common/dot_indicator.dart';


// Section-specific widgets
import 'package:clothingstore/features/products/presentation/pages/single_product/single_product_view.dart';
import 'package:clothingstore/features/home/presentation/widgets/section_heading.dart';

// Men tab widgets
import 'package:clothingstore/features/home/presentation/pages/men_tab_screen/widgets/men_new_arrivel_list.dart';
import 'package:clothingstore/features/home/presentation/pages/men_tab_screen/widgets/men_categorys_grid_list.dart';
import 'package:clothingstore/features/home/presentation/pages/men_tab_screen/widgets/men_top_picks_list.dart';
import 'package:clothingstore/features/home/presentation/pages/men_tab_screen/widgets/men_minimal_style_categorie_list.dart';
import 'package:clothingstore/features/home/presentation/pages/men_tab_screen/widgets/men_sharp_dressing_list.dart';

class MenTabScreen extends StatelessWidget {
  const MenTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    const int maxCount = 5;
    const int totalCount = 10;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Banner showing discount offers
        DiscountBanner(screenWidth: screenWidth, screenHeight: screenHeight),

        SizedBox(height: screenHeight * 0.002),

        // Image carousel section
        CarouselSliderSection(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
        ),

        // Carousel dot indicator
        DotIndicator(position: 1),

        SizedBox(height: screenHeight * 0.02),

        // Section heading for new arrivals
        SectionHeading(screenHeight: screenHeight, sectionName: "NEW ARRIVELS"),

        // Horizontal list of new arrival products
        MenNewArrivelList(
          products: [],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SingleProductsScreen()),
            );
          },
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          totalCount: totalCount,
        ),

        // Dot indicator for new arrival list
        DotIndicator(position: 1, dotCount: maxCount),

        SizedBox(height: screenHeight * 0.02),

        // Section heading for categories
        SectionHeading(screenHeight: screenHeight, sectionName: "CATEGORYS"),

        // Grid view of product categories
        MenCategorysGridList(
          isNotCategory: true,
          screenHeight: screenHeight,
          screenWidth: screenWidth,
        ),

        SizedBox(height: screenHeight * 0.02),

        // Section heading for top picks
        SectionHeading(screenHeight: screenHeight, sectionName: "TOP PICKS"),

        // Horizontal list of top picks
        MenTopPicksList(
          products: [],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SingleProductsScreen()),
            );
          },
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          totalCount: totalCount,
        ),

        SizedBox(height: screenHeight * 0.02),

        // Section heading for minimal styles
        SectionHeading(
          screenHeight: screenHeight,
          sectionName: "MINIMAL STYELS",
        ),

        // Grid list of minimal style categories
        MenMinimalStyleCategorieList(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
        ),

        // Dot indicator for minimal styles
        DotIndicator(position: 1, dotCount: 3),

        SizedBox(height: screenHeight * 0.02),

        // Section heading for sharp dressing
        SectionHeading(
          screenHeight: screenHeight,
          sectionName: "SHARP DRESSING",
        ),

        // List of products under sharp dressing
        MenSharpDressingList(
          screenHeight: screenHeight,
          screenWidth: screenWidth,
          totalCount: totalCount,
        ),

        SizedBox(height: screenHeight * 0.02),
      ],
    );
  }
}
