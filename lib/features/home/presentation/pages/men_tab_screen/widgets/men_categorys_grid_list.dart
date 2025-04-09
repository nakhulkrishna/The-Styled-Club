import 'package:clothingstore/common/bloc/scroll_cubit/scroll_cubit.dart';
import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/features/products/presentation/bloc/categories/categorie_cubit.dart';
import 'package:clothingstore/features/products/presentation/bloc/categories/categorie_state.dart';

import 'package:clothingstore/features/products/presentation/pages/categoriesed_products/pages/categoried_products_list.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MenCategorysGridList extends StatelessWidget {
  const MenCategorysGridList({
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
    final scrollController = ScrollController();

    scrollController.addListener(() {
      double offset = scrollController.offset;
      double itemWidth = screenWidth * 0.5; // Must match ProductCard width
      int currentIndex = (offset / itemWidth).round();

      context.read<ScrollIndexCubit>().updateIndex(currentIndex);
    });
    return SizedBox(
      height: screenHeight * 0.48,
      child: BlocBuilder<NormalCategorieCubit, NormalCategoriesState>(
        builder: (context, state) {
          if (state is NormalCategoriesLoading) {
            return GridView.builder(
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
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: GColors.lightContainers,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is NormalCategoriesLoaded) {
            return GridView.builder(
              addSemanticIndexes: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.normalCategoriess.length,

              itemBuilder: (context, index) {
                final categoriess = state.normalCategoriess[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 5),
                  child: GestureDetector(
                    onTap: () {
                      context.pushNamed(
                        'categoryProducts',
                        pathParameters: {
                          'categoryId': categoriess.name,
                          'itemCategory': categoriess.itemCategory,
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: GColors.lightContainers,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          categoriess.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (state is NormalCategoriesError) {
            return GridView.builder(
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
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: GColors.lightContainers,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return GridView.builder(
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
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: GColors.lightContainers,
                        borderRadius: BorderRadius.circular(6),
                      ),
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
