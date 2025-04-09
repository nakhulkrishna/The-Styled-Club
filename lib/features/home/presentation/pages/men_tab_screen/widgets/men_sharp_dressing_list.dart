import 'package:clothingstore/common/bloc/scroll_cubit/scroll_cubit.dart';
import 'package:clothingstore/core/constants/colors.dart';
import 'package:clothingstore/features/products/presentation/bloc/categories/categorie_cubit.dart';
import 'package:clothingstore/features/products/presentation/bloc/categories/categorie_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MenSharpDressingList extends StatelessWidget {
  const MenSharpDressingList({
    super.key,
    required this.screenHeight,
    required this.totalCount,

    required this.screenWidth,
  });

  final double screenHeight;
  final int totalCount;

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    final cubit = context.read<ScrollIndexCubit>();

    controller.addListener(() {
      final index =
          (controller.offset / (screenWidth * 0.7))
              .round(); // Adjust as per item width
      cubit.updateIndex(index);
    });
    return BlocBuilder<SharpDressingStyleCubit, SharpDressingCategoriesState>(
      builder: (context, state) {
        if (state is SharpDressingCategoriesLoading) {
          return SizedBox(
            height: screenHeight * 0.31,
            child: ListView.builder(
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: totalCount,
              controller: controller,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(2),
                  child: SizedBox(
                    width: screenWidth * 0.7,

                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            
                          },
                          child: Container(
                            width: screenWidth,
                            decoration: BoxDecoration(
                              color: GColors.light,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: screenHeight * 0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is SharpDressingCategoriesLoaded) {
          return SizedBox(
            height: screenHeight * 0.31,
            child: ListView.builder(
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.sharpDressingStyleCategoriess.length,
              controller: controller,
              itemBuilder: (context, index) {
                final sharpDressing =
                    state.sharpDressingStyleCategoriess[index];
                return Padding(
                  padding: const EdgeInsets.all(2),
                  child: SizedBox(
                    width: screenWidth * 0.7,

                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.pushNamed(
                              'MinimalcategoryProducts',
                              pathParameters: {
                                'categoryId': sharpDressing.name,
                                'itemCategory':
                                    sharpDressing.itemCategory,
                              },
                            );
                          },
                          child: Container(
                            width: screenWidth,
                            decoration: BoxDecoration(
                              color: GColors.light,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: screenHeight * 0.3,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(
                                sharpDressing.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is SharpDressingCategoriesError) {
          return SizedBox(
            height: screenHeight * 0.31,
            child: ListView.builder(
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: totalCount,
              controller: controller,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(2),
                  child: SizedBox(
                    width: screenWidth * 0.7,

                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => MenSharpDressingList(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      totalCount: 1,
                                    ),
                              ),
                            );
                          },
                          child: Container(
                            width: screenWidth,
                            decoration: BoxDecoration(
                              color: GColors.light,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: screenHeight * 0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return SizedBox(
            height: screenHeight * 0.31,
            child: ListView.builder(
              physics: ScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: totalCount,
              controller: controller,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(2),
                  child: SizedBox(
                    width: screenWidth * 0.7,

                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => MenSharpDressingList(
                                      screenHeight: screenHeight,
                                      screenWidth: screenWidth,
                                      totalCount: 1,
                                    ),
                              ),
                            );
                          },
                          child: Container(
                            width: screenWidth,
                            decoration: BoxDecoration(
                              color: GColors.light,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: screenHeight * 0.3,
                          ),
                        ),
                      ],
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
