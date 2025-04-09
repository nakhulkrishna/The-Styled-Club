import 'package:clothingstore/common/bloc/scroll_cubit/scroll_cubit.dart';
import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/features/products/presentation/bloc/categories/categorie_cubit.dart';
import 'package:clothingstore/features/products/presentation/bloc/categories/categorie_state.dart';

import 'package:clothingstore/features/products/presentation/pages/minimal_style_products/minimal_style_products_list.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MenMinimalStyleCategorieList extends StatelessWidget {
  const MenMinimalStyleCategorieList({
    super.key,
    required this.screenHeight,

    required this.screenWidth,
    this.isNotCategory = false,
  });

  final double screenHeight;

  final double screenWidth;

  final bool isNotCategory;

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    final cubit = context.read<ScrollIndexCubit>();

    controller.addListener(() {
      final index =
          (controller.offset / (screenWidth * 0.3))
              .round(); // Adjust as per item width
      cubit.updateIndex(index);
    });

    return SizedBox(
      height: screenHeight * 0.48,
      child:
          BlocBuilder<MinimalStyleCategoriesCubit, MinimalStyleCategoriesState>(
            builder: (context, state) {
              if (state is MinimalStyleCategoriesLoading) {
                return GridView.builder(
                  controller: controller,
                  addSemanticIndexes: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,

                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Container(
                          color: GColors.light,
                          height: screenHeight * 0.02,
                          width: screenWidth * 0.3,
                        ),
                      ),
                    );
                  },
                );
              } else if (state is MinimalStyleCategoriesLoaded) {
                return GridView.builder(
                  controller: controller,
                  addSemanticIndexes: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.minimalStyleCategoriess.length,

                  itemBuilder: (context, index) {
                    final minimalstyleCategories =
                        state.minimalStyleCategoriess[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 5),
                      child: GestureDetector(
                        onTap: () {
                          context.pushNamed(
                            'MinimalcategoryProducts',
                            pathParameters: {
                              'categoryId': minimalstyleCategories.name,
                              'itemCategory':
                                  minimalstyleCategories.itemCategory,
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Container(
                            color: GColors.light,
                            height: screenHeight * 0.02,
                            width: screenWidth * 0.3,
                            child: Center(
                              child: Image.network(
                                minimalstyleCategories.image,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(
                                    Icons.broken_image,
                                    size: 50,
                                    color: Colors.grey,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              } else if (state is MinimalStyleCategoriesError) {
                return GridView.builder(
                  controller: controller,
                  addSemanticIndexes: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,

                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Container(
                          color: GColors.light,
                          height: screenHeight * 0.02,
                          width: screenWidth * 0.3,
                        ),
                      ),
                    );
                  },
                );
              } else {
                return GridView.builder(
                  controller: controller,
                  addSemanticIndexes: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  physics: ScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,

                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8, bottom: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Container(
                          color: GColors.light,
                          height: screenHeight * 0.02,
                          width: screenWidth * 0.3,
                        ),
                      ),
                    );
                  },
                );
              }
            },
          ),
    );
  }
}
