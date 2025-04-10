import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/features/products/presentation/bloc/categories/categorie_cubit.dart';
import 'package:clothingstore/features/products/presentation/bloc/categories/categorie_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WomenMinimalStyleCategorieList extends StatelessWidget {
  const WomenMinimalStyleCategorieList({
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
    return BlocBuilder<
      WomenMinimalStyleCategoriesCubit,
      WomenMinimalStyleCategoriesState
    >(
      builder: (context, state) {
        if (state is WomenMinimalStyleCategoriesLoading) {
          return SizedBox(
            height: screenHeight * 0.48,
            child: GridView.builder(
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
                        color: GColors.light,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is WomenMinimalStyleCategoriesLoaded) {
          return SizedBox(
            height: screenHeight * 0.48,
            child: GridView.builder(
              addSemanticIndexes: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.WomenminimalStyleCategoriess.length,

              itemBuilder: (context, index) {
                final categories = state.WomenminimalStyleCategoriess[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 5),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        color: GColors.light,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          categories.image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is WomenMinimalStyleCategoriesError) {
          return SizedBox(
            height: screenHeight * 0.48,
            child: GridView.builder(
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
                        color: GColors.light,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return SizedBox(
            height: screenHeight * 0.48,
            child: GridView.builder(
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
                        color: GColors.light,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
