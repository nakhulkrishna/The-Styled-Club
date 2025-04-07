import 'package:clothingstore/features/data/abstract/bloc/base_event.dart';
import 'package:clothingstore/features/data/abstract/bloc/base_state.dart';
import 'package:clothingstore/features/data/models/products/product_model.dart';
import 'package:clothingstore/features/presentation/logic/indicators/carousel_indicator_cubit.dart';
import 'package:clothingstore/features/presentation/logic/indicators/men_minimal_style_dot_indicator.dart';
import 'package:clothingstore/features/presentation/logic/indicators/men_new_arrivels_dot_indicator.dart';
import 'package:clothingstore/features/presentation/logic/products/bloc/products_bloc.dart';
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

class MenTabScreen extends StatelessWidget {
  const MenTabScreen({
    super.key,
    required this.newArrivelsSrollController,
    required this.minimalStyleSrollController,
  });
  final ScrollController newArrivelsSrollController;
  final ScrollController minimalStyleSrollController;
  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(FetchItems<ProductModel>());

    List<String> categorys = [
      "POLOS",
      "JACKETS & MORE",
      "SHORTS &  BOXERS",
      "ACCESSORIES",
      "T-SHIRTS",
      "SHIRTS",
      "BOTTOMS",
      "SNEAKERS",
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
        BlocBuilder<ProductBloc, BaseState<ProductModel>>(
          builder: (context, state) {
            if (state is BaseLoading<ProductModel>) {
              return CircularProgressIndicator();
            }
            if (state is BaseLoaded<ProductModel>) {
              return ListviewProductsCard(
                products: state.filteredItems,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SingleProductsScreen(),
                    ),
                  );
                },

                screenHeight: screenHeight,
                totalCount: state.filteredItems.length,
                scrollController: newArrivelsSrollController,
                screenWidth: screenWidth,
              );
            }
            if (state is BaseError<ProductModel>) {
              return Text("Error: ${state.message}");
            }
            return SizedBox();
          },
        ),

        //* products index dot indicator
        BlocBuilder<MenNewArrivelsDotIndicator, int>(
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
          sectionName: "MINIMAL STYELS",
        ),

        //* minimal style
        GridViewCard(
          scrollController: minimalStyleSrollController,
          screenHeight: screenHeight,

          screenWidth: screenWidth,
        ),
        BlocBuilder<MenMinimalStyleDotIndicator, int>(
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
