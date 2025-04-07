import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/features/presentation/logic/categories/categories_bloc.dart';
import 'package:clothingstore/features/presentation/logic/categories/categories_event.dart';
import 'package:clothingstore/features/presentation/logic/categories/categories_state.dart';
import 'package:clothingstore/features/presentation/pages/home/categoriesedProducts/categoriesed_products_page.dart';
import 'package:clothingstore/features/presentation/pages/home/minimalStyleProducts.dart/minimal_style_products_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

class GridViewCard extends StatelessWidget {
  const GridViewCard({
    super.key,
    required this.screenHeight,

    this.scrollController,
    required this.screenWidth,
    this.isNotCategory = false,
  });

  final double screenHeight;

  final ScrollController? scrollController;
  final double screenWidth;

  final bool isNotCategory;

  @override
  Widget build(BuildContext context) {
    context.read<CategoriesBloc>().add(FetchCategoriesEvent());
    return SizedBox(
      height: screenHeight * 0.48,
      child: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          if (state is CategoriesLoading) {
            return SizedBox(
              height: screenHeight * 0.01,
              width: screenWidth * 0.01,
              child: LoadingIndicator(
                indicatorType: Indicator.ballPulse,

                /// Required, The loading type of the widget
                colors: const [GColors.darkgery],
              ),
            );
          } else if (state is CategoriesLoaded) {
            return GridView.builder(
              addSemanticIndexes: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length,
              controller: scrollController,
              itemBuilder: (context, index) {
                final data = state.categories[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 5),
                  child:
                      isNotCategory
                          ? GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => CategorizedProductsPage(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.amberAccent,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.network(
                                  data.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                          : GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => MinimalStyleProductsPage(),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.amberAccent,

                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Container(
                                color: GColors.light,
                                height: screenHeight * 0.02,
                                width: screenWidth * 0.3,
                                child: Center(
                                  child: Text(
                                    data.name,
                                    style: GoogleFonts.poppins(fontSize: 10),
                                  ),
                                ),
                              ),
                            ),
                          ),
                );
              },
            );
          } else if (state is CategoriesError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text("No Categories available"));
        },
      ),
    );
  }
}
